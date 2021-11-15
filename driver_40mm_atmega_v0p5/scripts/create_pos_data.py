from __future__ import print_function

def get_quad_led_pos(quad_num,params):

    if quad_num == 0:
        quad_x_offset = params['pcb_x_offset']
        quad_y_offset = params['pcb_y_offset']
    elif quad_num == 1:
        quad_x_offset = params['pcb_x_offset']
        quad_y_offset = params['pcb_y_offset'] + params['quad_y_dim']
    elif quad_num == 2:
        quad_x_offset = params['pcb_x_offset'] + params['quad_x_dim']
        quad_y_offset = params['pcb_y_offset'] 
    elif quad_num == 3:
        quad_x_offset = params['pcb_x_offset'] + params['quad_x_dim']
        quad_y_offset = params['pcb_y_offset'] + params['quad_y_dim']
    else:
        raise ValueError, 'quadrant number out of range'

    # Create index and reference lists for leds in quadrant
    ind_x = range(1,params['num_x_led_per_quad']+1)
    ind_y = range(1,params['num_y_led_per_quad']+1)
    ind_list = []
    ref_list =  []
    ref_cntr = quad_num*params['num_x_led_per_quad']*params['num_y_led_per_quad']
    for ix in ind_x:
        for iy in ind_y:
            ref_cntr += 1
            ind_list.append((ix,iy))
            ref_list.append('D{0}'.format(ref_cntr))

    # Create list of led positions
    ix_scale = float(params['num_x_led_per_quad']+1)/float(params['num_x_led_per_quad'])
    iy_scale = float(params['num_y_led_per_quad']+1)/float(params['num_y_led_per_quad'])

    pos_list = [(ix_scale*(ix-0.5), iy_scale*(iy-0.5)) for ix, iy in ind_list]

    pos_x_scale = params['quad_x_dim']/float(params['num_x_led_per_quad']+1)
    pos_y_scale = params['quad_y_dim']/float(params['num_y_led_per_quad']+1)

    pos_list = [(x*pos_x_scale + quad_x_offset, y*pos_y_scale + quad_y_offset) for x,y in pos_list]
    
    # Create dictionary mapping led references to les positions
    ref_to_pos_dict = {}
    for ref,pos in zip(ref_list,pos_list):
        ref_to_pos_dict[ref] = pos

    return ref_to_pos_dict
    
def get_led_pos(params):
    ref_to_pos_dict = {}
    for i in range(4):
        ref_to_pos_dict.update(get_quad_led_pos(i,params))
    return ref_to_pos_dict

def write_led_pos_data(params):
    ref_to_pos_dict = get_led_pos(params)
    with open(params['outfile'],'w') as f:
        for k,v in ref_to_pos_dict.iteritems():
            f.write('{0} '.format(k))
            f.write('{0} {1} '.format(*v))
            f.write('{0}\n'.format(params['led_angle']))


# -----------------------------------------------------------------------------
if __name__ == '__main__':


    params = { 
            'outfile' : 'pos_data.txt',
            'pcb_x_offset' : 50.0,
            'pcb_y_offset' : 50.0,
            'quad_x_dim' : 20.0,
            'quad_y_dim' : 20.0,
            'num_x_led_per_quad' : 8, 
            'num_y_led_per_quad' : 8, 
            'led_angle' : 45,
            }

    write_led_pos_data(params)
    












