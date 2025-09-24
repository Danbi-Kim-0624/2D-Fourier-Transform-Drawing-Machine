%% Make Black Point List
function Black_Point = make_Black_Point(A)
    size_A = size(A);
    Black_Point = [];
    for i=1:size_A(1)
        for j=1:size_A(2)
            if(A(i, j, 1) < 1 && A(i, j, 2) < 1 && A(i, j, 3) < 1)
                Black_Point = [Black_Point; [i-250, j-250]];
            end
        end
    end
end

%% We can use different crieteria image by image
% function Black_Point = make_Black_Point(A)
%     size_A = size(A);
%     Black_Point = [];
%     for i=1:size_A(1)
%         for j=1:size_A(2)
%             if((A(i, j, 1)+A(i, j, 2)+A(i, j, 3))/3 < 200)
%                 Black_Point = [Black_Point; [i-250, j-250]];
%             end
%         end
%     end
% end