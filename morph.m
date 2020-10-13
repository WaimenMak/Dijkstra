% Homography
x = [1 1 5 5];  %方形原图
y = [1 4 4 1];

% x = [1 1 5 5];  %任意原图
% y = [2 4 4 1];

% x_t = [7 5 5 9];  %扭曲图
% y_t = [6 5 6 8];

x_t = [5 1 5 9];  %扭曲图
y_t = [10 6 5 8];

plot(x,y,'.',x_t,y_t,'r.')
axis([0,10,0,10])

A = [x(1) y(1) 1 0 0 0 -x_t(1)*x(1) -x_t(1)*y(1);
     0 0 0 x(1) y(1) 1 -y_t(1)*x(1) -y_t(1)*y(1);
     x(2) y(2) 1 0 0 0 -x_t(2)*x(2) -x_t(2)*y(2); 
     0 0 0 x(2) y(2) 1 -y_t(2)*x(2) -y_t(2)*y(2); 
     x(3) y(3) 1 0 0 0 -x_t(3)*x(3) -x_t(3)*y(3); 
     0 0 0 x(3) y(3) 1 -y_t(3)*x(3) -y_t(3)*y(3); 
     x(4) y(4) 1 0 0 0 -x_t(4)*x(4) -x_t(4)*y(4); 
     0 0 0 x(4) y(4) 1 -y_t(4)*x(4) -y_t(4)*y(4)] ;
 
 b = [x_t(1);y_t(1);x_t(2);y_t(2);x_t(3);y_t(3);x_t(4);y_t(4);];
 
 
 [L,U] = lu(A);
 x_solve = U\(L\b);
 
X = [x_solve;1];
H = reshape(X, 3,3)';


new = [x(1) x(2) x(3) x(4);
       y(1) y(2) y(3) y(4); 
       1 1 1 1 ];
N = 0;
M = 200;
% for j = 1:N  %边缘点
%     x_new = 1 + 4*rand;
%     y_new = 4;
%     new = [new [x_new;y_new;1]];
%     x_new = 1;
%     y_new = 1 + 3*rand;
%     new = [new [x_new;y_new;1]];
%     
%     x_new = 5;
%     y_new = 1 + 3*rand;
%     new = [new [x_new;y_new;1]];
%     
%     x_new = 1 + 4*rand;
%     y_new = 1;
%     new = [new [x_new;y_new;1]];
% end

 
% for j = 1:M   %凸组合撒随机点
%     lambda = rand(1,4);
%     s = sum(lambda);
%     x_new = (lambda(1)*x(1) + lambda(2)*x(2) + lambda(3)*x(3) + lambda(4)*x(4))/s;
%     y_new = (lambda(1)*y(1) + lambda(2)*y(2) + lambda(3)*y(3) + lambda(4)*y(4))/s;
%     new = [new [x_new;y_new;1]]; 
% end
for j = 1:M   %方形撒随机点
    x_new = 1 + 4*rand;
    y_new = 1 + 3*rand;
    new = [new [x_new;y_new;1]]; 
end


new_T = H*new;

for i = 1:4+N+M  %4组点  这步非常关键，把第三维归一化才能得到原来的扭曲形状
    new_T(:,i) = new_T(:,i)/(H(3,:)*new(:,i));
end
figure(2)
plot(new(1,:),new(2,:),'.',new_T(1,:),new_T(2,:),'r.');

axis([0,10,0,10])       
       