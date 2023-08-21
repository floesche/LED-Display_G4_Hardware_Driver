from __future__ import print_function
import sys

def loadPcbLines(filename):
    with open(filename,'r') as f:
        lineList = f.readlines()
    return lineList

def savePcbLines(lineList,filename):
    with open(filename,'w') as f:
        for line in lineList:
            f.write(line)

def loadRefToPosFile(filename):
    """
    Load data file specifying desired position and and orientation for modules
    by reference.
    """
    with open(filename,'r') as f:
        lineList = f.readlines()
    refToPosDict = {}
    for line in lineList:
        line = line.strip()
        line = line.split(' ')
        refToPosDict[line[0]] = tuple([float(x) for x in line[1:]])
    return refToPosDict

def findModuleStartIndex(pcbLineList, ref):
    """
    Returns the line index at which the moduels starts
    """
    lastModuleIndex = -1
    moduleIndex = None
    for i, line in enumerate(pcbLineList):
        if 'module' in line:
            lastModuleIndex = i
            continue
        refStr = ' {0} '.format(ref)
        if refStr in line:
            moduleIndex = lastModuleIndex
            break
    return moduleIndex 

def findModuleStopIndex(pcbLineList, ref):
    startIndex = findModuleStartIndex(pcbLineList,ref)
    done = False
    parCount = 0
    linePos = startIndex
    while not done:
        line = pcbLineList[linePos]
        parCount += line.count('(') - line.count(')')
        if parCount == 0:
            done = True
        else:
            linePos += 1
    return linePos

def setModulePosition(pcbLineList,ref,pos):
    """
    Sets the module position - this is bit of a hack.
    """ 
    startIndex = findModuleStartIndex(pcbLineList,ref)
    stopIndex = findModuleStopIndex(pcbLineList,ref) 

    for i, line in enumerate(pcbLineList[startIndex:stopIndex]):
        lineIndex = startIndex + i
        atPos = line.find('at ')
        if atPos != -1:
            if lineIndex == (startIndex + 1):
                atLineMod = '{0}at {1} {2} {3})\n'.format(line[:atPos],pos[0], pos[1], pos[2])
                pcbLineList[lineIndex] = atLineMod
            else:
                done = False
                parCnt = 1
                atLeftParPos = atPos-1
                atRightParPos = atLeftParPos
                while parCnt>0:
                    atRightParPos += 1
                    if line[atRightParPos] == ')':
                        parCnt -= 1
                    elif line[atRightParPos] == '(':
                        parCnt += 1
                atString = line[atLeftParPos:atRightParPos+1]
                if not 'xyz' in atString:
                    atTuple = atString[1:-1].split()
                    atLineMod = '{0}(at {1} {2} {3}){4}'.format(line[:atLeftParPos], float(atTuple[1]), float(atTuple[2]), pos[2],line[atRightParPos+1:])
                    pcbLineList[lineIndex] = atLineMod



# --------------------------------------------------------------------------------
if __name__ == '__main__':

    inFile = 'driver.kicad_pcb.template'
    outFile = 'driver.kicad_pcb.mod'
    refToPosFile = 'pos_data.txt'

    pcbLineList = loadPcbLines(inFile)
    refToPosDict = loadRefToPosFile(refToPosFile)

    for ref, pos in refToPosDict.iteritems():
        setModulePosition(pcbLineList,ref,pos)

    savePcbLines(pcbLineList,outFile)

