%% Interpolate the given graph
% using linear interpolation
% f(t) : periodic, T = 1
function result = draw_obj(t, Black_Point)
    len_Black_Point = length(Black_Point);
    t = rem(t, 1);                              % consider it as periodic function
    % We can generalize about any time t using the internal division point.
    % It calculate the internal division point with respect to given time
    % if the Black_Point doen't have direct corresponding points
    i = 1 + (len_Black_Point-1)*t;
    m = floor(i);
    x = i-m;
    pos1 = Black_Point(m, :);
    pos2 = Black_Point(m+1, :);
    a = (1-x)*pos1(1) + x*pos2(1);
    b = (1-x)*pos1(2) + x*pos2(2);
    result = a+b*1i;
end