%% Make the path of given Drawing
function time_Black_Point = make_Path(Black_Point)
    len_Black_Point = length(Black_Point);
    time_Black_Point = zeros(len_Black_Point, 2);
    time_Black_Point(1, :) = Black_Point(1,:);
    old_point = Black_Point(1,:); %initial point
    Black_Point(1, :) = [];

    for i =2:len_Black_Point-1
        %find the closest point
        min_distance = 1000;    %arbitrary upper bound of maximum distance
        min_index = 0;
        min_pos = [0, 0];
        for m = 1:length(Black_Point)
           pos = Black_Point(m, :);
           distance = sqrt(( old_point(1) - pos(1) )^2 + ( old_point(2) - pos(2) )^2);
           if(distance < min_distance)
                min_distance = distance;
                min_index = m;
                min_pos = pos;
           end
        end

        old_point = min_pos;
        time_Black_Point(i, :) = min_pos;
        Black_Point(min_index, :) = [];
    end
    
    time_Black_Point(end,:) = Black_Point;
end