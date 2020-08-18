function [dis trace, distance] = Dijsktra(G,origin,destination)
    vertex_set = [origin];
    inf = 100; %经过点的集合中加入起始点，不相连边设置较大数
    dis_set = inf*ones(1,size(G,1));    %记录起点到经过的每一点的最短距离
    
    
    dis_set(1) = 0;
    
    while vertex_set(end) ~= destination
        min = inf; 
        for i = 1:length(vertex_set)
            neighbor = find(G(vertex_set(i),:) ~= inf);
            for j = 1:length(neighbor)
                if G(vertex_set(i),neighbor(j)) + dis_set(vertex_set(i))< min && ~ismember(neighbor(j),vertex_set)    %邻居点是否已经探索过
                    min = G(vertex_set(i),neighbor(j)) + dis_set(vertex_set(i));
                    k = neighbor(j); m = vertex_set(i);
                    
                end
            end

        end
        vertex_set = [vertex_set, k];
        dis_set(k) = min;
        index = find(vertex_set == m);
        origin = [vertex_set(1:index), k];
    end
    trace = origin;
    distance = dis_set(destination);
    dis = dis_set;
end