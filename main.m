G = zeros(8);
G(1,2)=2;G(1,4)=6;G(1,6) = 9;%���þ����з���������ֵ
G(2,3)=30;G(2,4)=1;
G(3,8)=5;
G(4,5)=2;
G(5,3)=8;G(5,7)=7;
G(6,5)=3;G(6,7)=24;
G(7,8)=21;

inf = 100;
for i = 1:size(G,1)
    for j = 1:size(G,1)
        if G(i,j) == 0
            G(i,j) = inf;
        end
    end
end

origin = 1;
destination = 7;

%dis�а����������㵽ԭ�����̾���
[dis, trace, min_distance] = Dijsktra(G,origin,destination);