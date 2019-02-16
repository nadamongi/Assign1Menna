clc
clear All
p=length(price);
%iterations=100;
alpha=0.01;
%plot(grade,price, 'rx', 'MarkerSize', 10);

% features=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15];

% features0=[ones(p,1), sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15];
% HP4=[ones(p,1), sqft_above.^4, sqft_basement.^4, yr_built.^4, yr_renovated.^4, zipcode.^4, lat.^4, long.^4, sqft_living15.^4, sqft_lot15.^4];
% HP8=[ones(p,1), sqft_above.^8, sqft_basement.^8, yr_built.^8, yr_renovated.^8, zipcode.^8, lat.^8, long.^8, sqft_living15.^8, sqft_lot15.^8];

% features01=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, HP4];
% features02=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, HP8];

% H1=[bedrooms.^2,bathrooms.^2,bedrooms.^3,bathrooms.^3,waterfront.^2,view1.^2,floors.^2,floors.^3,grade.^2,condition.^2,condition.^3];
% H1P58=[bedrooms.^5,bathrooms.^5,bedrooms.^8,bathrooms.^8,waterfront.^5,view1.^5,floors.^5,floors.^8,grade.^5,condition.^5,condition.^8];
% H1P79=[bedrooms.^9,bathrooms.^7,bedrooms.^9,bathrooms.^9,waterfront.^7,view1.^7,floors.^7,floors.^9,grade.^7,condition.^7,condition.^9];
% features1=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H1];
% features11=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H1P58];
% features12=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H1P79];
% 
H2=[bedrooms(1:12968,:).^10,bathrooms(1:12968,:).^10,floors(1:12968,:).^10,waterfront(1:12968,:).^10,view1(1:12968,:).^10,grade(1:12968,:).^10,condition(1:12968,:).^10];
H2P2=[bedrooms(1:12968,:).^2,bathrooms(1:12968,:).^2,floors(1:12968,:).^2,waterfront(1:12968,:).^2,view1(1:12968,:).^2,grade(1:12968,:).^2,condition(1:12968,:).^2];
H2P5=[bedrooms(1:12968,:).^5,bathrooms(1:12968,:).^5,floors(1:12968,:).^5,waterfront(1:12968,:).^5,view1(1:12968,:).^5,grade(1:12968,:).^5,condition(1:12968,:).^5];

features2=[ones(12968,1), bedrooms(1:12968,:), bathrooms(1:12968,:), sqft_living(1:12968,:), sqft_lot(1:12968,:), floors(1:12968,:), waterfront(1:12968,:), view1(1:12968,:), condition(1:12968,:), grade(1:12968,:), sqft_above(1:12968,:), sqft_basement(1:12968,:), yr_built(1:12968,:), yr_renovated(1:12968,:), zipcode(1:12968,:), lat(1:12968,:), long(1:12968,:), sqft_living15(1:12968,:), sqft_lot15(1:12968,:), H2];
features21=[ones(12968,1), bedrooms(1:12968,:), bathrooms(1:12968,:), sqft_living(1:12968,:), sqft_lot(1:12968,:), floors(1:12968,:), waterfront(1:12968,:), view1(1:12968,:), condition(1:12968,:), grade(1:12968,:), sqft_above(1:12968,:), sqft_basement(1:12968,:), yr_built(1:12968,:), yr_renovated(1:12968,:), zipcode(1:12968,:), lat(1:12968,:), long(1:12968,:), sqft_living15(1:12968,:), sqft_lot15(1:12968,:), H2P2];
features22=[ones(12968,1), bedrooms(1:12968,:), bathrooms(1:12968,:), sqft_living(1:12968,:), sqft_lot(1:12968,:), floors(1:12968,:), waterfront(1:12968,:), view1(1:12968,:), condition(1:12968,:), grade(1:12968,:), sqft_above(1:12968,:), sqft_basement(1:12968,:), yr_built(1:12968,:), yr_renovated(1:12968,:), zipcode(1:12968,:), lat(1:12968,:), long(1:12968,:), sqft_living15(1:12968,:), sqft_lot15(1:12968,:), H2P5];

H20=[bedrooms(12969:17291,:).^10,bathrooms(12969:17291,:).^10,floors(12969:17291,:).^10,waterfront(12969:17291,:).^10,view1(12969:17291,:).^10,grade(12969:17291,:).^10,condition(12969:17291,:).^10];
H22P2=[bedrooms(12969:17291,:).^2,bathrooms(12969:17291,:).^2,floors(12969:17291,:).^2,waterfront(12969:17291,:).^2,view1(12969:17291,:).^2,grade(12969:17291,:).^2,condition(12969:17291,:).^2];
H22P5=[bedrooms(12969:17291,:).^5,bathrooms(12969:17291,:).^5,floors(12969:17291,:).^5,waterfront(12969:17291,:).^5,view1(12969:17291,:).^5,grade(12969:17291,:).^5,condition(12969:17291,:).^5];

features20=[ones(4322,1), bedrooms(12969:17291,:), bathrooms(12969:17291,:), sqft_living(12969:17291,:), sqft_lot(12969:17291,:), floors(12969:17291,:), waterfront(12969:17291,:), view1(12969:17291,:), condition(12969:17291,:), grade(12969:17291,:), sqft_above(12969:17291,:), sqft_basement(12969:17291,:), yr_built(12969:17291,:), yr_renovated(12969:17291,:), zipcode(12969:17291,:), lat(12969:17291,:), long(12969:17291,:), sqft_living15(12969:17291,:), sqft_lot15(12969:17291,:), H20];
features211=[ones(4322,1), bedrooms(12969:17291,:), bathrooms(12969:17291,:), sqft_living(12969:17291,:), sqft_lot(12969:17291,:), floors(12969:17291,:), waterfront(12969:17291,:), view1(12969:17291,:), condition(12969:17291,:), grade(12969:17291,:), sqft_above(12969:17291,:), sqft_basement(12969:17291,:), yr_built(12969:17291,:), yr_renovated(12969:17291,:), zipcode(12969:17291,:), lat(12969:17291,:), long(12969:17291,:), sqft_living15(12969:17291,:), sqft_lot15(12969:17291,:), H22P2];
features222=[ones(4322,1), bedrooms(12969:17291,:), bathrooms(12969:17291,:), sqft_living(12969:17291,:), sqft_lot(12969:17291,:), floors(12969:17291,:), waterfront(12969:17291,:), view1(12969:17291,:), condition(12969:17291,:), grade(12969:17291,:), sqft_above(12969:17291,:), sqft_basement(12969:17291,:), yr_built(12969:17291,:), yr_renovated(12969:17291,:), zipcode(12969:17291,:), lat(12969:17291,:), long(12969:17291,:), sqft_living15(12969:17291,:), sqft_lot15(12969:17291,:), H22P5];

H22P2=[bedrooms(4322,:).^2,bathrooms(17292:21614,:).^2,floors(17292:21614,:).^2,waterfront(17292:21614,:).^2,view1(17292:21614,:).^2,grade(17292:21614,:).^2,condition(17292:21614,:).^2];
features2220=[ones(4322,1), bedrooms(17292:21614,:), bathrooms(17292:21614,:), sqft_living(17292:21614,:), sqft_lot(17292:21614,:), floors(17292:21614,:), waterfront(17292:21614,:), view1(17292:21614,:), condition(17292:21614,:), grade(17292:21614,:), sqft_above(17292:21614,:), sqft_basement(17292:21614,:), yr_built(17292:21614,:), yr_renovated(17292:21614,:), zipcode(17292:21614,:), lat(17292:21614,:), long(17292:21614,:), sqft_living15(17292:21614,:), sqft_lot15(17292:21614,:), H330];


% features2=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H2];
% features21=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H2P2];
% features22=[ones(p,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H2P5];

H3=[floors(1:12968,:).^7,long(1:12968,:).^7,grade(1:12968,:).^7,yr_renovated(1:12968,:).^7,view1(1:12968,:).^7,condition(1:12968,:).^7,sqft_lot(1:12968,:).^7];
H3P3=[floors(1:12968,:).^3,long(1:12968,:).^3,grade(1:12968,:).^3,yr_renovated(1:12968,:).^3,view1(1:12968,:).^3,condition(1:12968,:).^3,sqft_lot(1:12968,:).^3];
H3P5=[floors(1:12968,:).^5,long(1:12968,:).^5,grade(1:12968,:).^5,yr_renovated(1:12968,:).^5,view1(1:12968,:).^5,condition(1:12968,:).^5,sqft_lot(1:12968,:).^5];

features3=[ones(12968,1), bedrooms(1:12968,:), bathrooms(1:12968,:), sqft_living(1:12968,:), sqft_lot(1:12968,:), floors(1:12968,:), waterfront(1:12968,:), view1(1:12968,:), condition(1:12968,:), grade(1:12968,:), sqft_above(1:12968,:), sqft_basement(1:12968,:), yr_built(1:12968,:), yr_renovated(1:12968,:), zipcode(1:12968,:), lat(1:12968,:), long(1:12968,:), sqft_living15(1:12968,:), sqft_lot15(1:12968,:), H3];
features31=[ones(12968,1), bedrooms(1:12968,:), bathrooms(1:12968,:), sqft_living(1:12968,:), sqft_lot(1:12968,:), floors(1:12968,:), waterfront(1:12968,:), view1(1:12968,:), condition(1:12968,:), grade(1:12968,:), sqft_above(1:12968,:), sqft_basement(1:12968,:), yr_built(1:12968,:), yr_renovated(1:12968,:), zipcode(1:12968,:), lat(1:12968,:), long(1:12968,:), sqft_living15(1:12968,:), sqft_lot15(1:12968,:), H3P3];
features32=[ones(12968,1), bedrooms(1:12968,:), bathrooms(1:12968,:), sqft_living(1:12968,:), sqft_lot(1:12968,:), floors(1:12968,:), waterfront(1:12968,:), view1(1:12968,:), condition(1:12968,:), grade(1:12968,:), sqft_above(1:12968,:), sqft_basement(1:12968,:), yr_built(1:12968,:), yr_renovated(1:12968,:), zipcode(1:12968,:), lat(1:12968,:), long(1:12968,:), sqft_living15(1:12968,:), sqft_lot15(1:12968,:), H3P5];

H30=[floors(12969:17291,:).^7,long(12969:17291,:).^7,grade(12969:14697,:).^7,yr_renovated(12969:17291,:).^7,view1(12969:17291,:).^7,condition(12969:17291,:).^7,sqft_lot(12969:17291,:).^7];
H33P3=[floors(12969:17291,:).^3,long(12969:17291,:).^3,grade(12969:14697,:).^3,yr_renovated(12969:17291,:).^3,view1(12969:17291,:).^3,condition(12969:17291,:).^3,sqft_lot(12969:17291,:).^3];
H33P5=[floors(12969:17291,:).^5,long(12969:17291,:).^5,grade(12969:14697,:).^5,yr_renovated(12969:17291,:).^5,view1(12969:17291,:).^5,condition(12969:17291,:).^5,sqft_lot(12969:17291,:).^5];

features30=[ones(4322,1), bedrooms(12969:17291,:), bathrooms(12969:17291,:), sqft_living(12969:17291,:), sqft_lot(12969:17291,:), floors(12969:17291,:), waterfront(12969:14697,:), view1(12969:17291,:), condition(12969:17291,:), grade(12969:17291,:), sqft_above(12969:17291,:), sqft_basement(12969:17291,:), yr_built(12969:17291,:), yr_renovated(12969:17291,:), zipcode(12969:17291,:), lat(12969:17291,:), long(12969:17291,:), sqft_living15(12969:17291,:), sqft_lot15(12969:17291,:), H3];
features311=[ones(4322,1), bedrooms(12969:17291,:), bathrooms(12969:17291,:), sqft_living(12969:17291,:), sqft_lot(12969:17291,:), floors(12969:17291,:), waterfront(12969:14697,:), view1(12969:17291,:), condition(12969:17291,:), grade(12969:17291,:), sqft_above(12969:17291,:), sqft_basement(12969:17291,:), yr_built(12969:17291,:), yr_renovated(12969:17291,:), zipcode(12969:17291,:), lat(12969:17291,:), long(12969:17291,:), sqft_living15(12969:17291,:), sqft_lot15(12969:17291,:), H33P3];
features322=[ones(4322,1), bedrooms(12969:17291,:), bathrooms(12969:17291,:), sqft_living(12969:17291,:), sqft_lot(12969:17291,:), floors(12969:17291,:), waterfront(12969:14697,:), view1(12969:17291,:), condition(12969:17291,:), grade(12969:17291,:), sqft_above(12969:17291,:), sqft_basement(12969:17291,:), yr_built(12969:17291,:), yr_renovated(12969:17291,:), zipcode(12969:17291,:), lat(12969:17291,:), long(12969:17291,:), sqft_living15(12969:17291,:), sqft_lot15(12969:17291,:), H33P5];

H330=[floors(17292:21614,:).^7,long(17292:21614,:).^7,grade(17292:21614,:).^7,yr_renovated(17292:21614,:).^7,view1(17292:21614,:).^7,condition(17292:21614,:).^7,sqft_lot(17292:21614,:).^7];
features330=[ones(4322,1), bedrooms(17292:21614,:), bathrooms(17292:21614,:), sqft_living(17292:21614,:), sqft_lot(17292:21614,:), floors(17292:21614,:), waterfront(17292:21614,:), view1(17292:21614,:), condition(17292:21614,:), grade(17292:21614,:), sqft_above(17292:21614,:), sqft_basement(17292:21614,:), yr_built(17292:21614,:), yr_renovated(17292:21614,:), zipcode(17292:21614,:), lat(17292:21614,:), long(17292:21614,:), sqft_living15(17292:21614,:), sqft_lot15(17292:21614,:), H330];

% features31=[ones(129681,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H3P3];
% features32=[ones(129681,1), bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view1, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, sqft_lot15, H3P5];

n3=length(features3(1,:));
theta3=zeros(n3,1);
for w=2:n3
    if max(abs(features3(:,w)))~=0
     features3(:,w)=(features3(:,w)-mean((features3(:,w))))./std(features3(:,w));
    end
    
end

Y=price/mean(price);

J3=costfunction(features3, Y, theta3);
[ theta3, J_history3 ] = Gradientdescentmethodfinal( features3,Y,theta3,alpha,J3 );

figure()
plot(1:length(J_history3) , J_history3);

n31=length(features31(1,:));
theta31=zeros(n31,1);
for w=2:n31
    if max(abs(features31(:,w)))~=0
     features31(:,w)=(features31(:,w)-mean((features31(:,w))))./std(features31(:,w));
    end
    
end

Y=price/mean(price);

J31=costfunction(features31, Y, theta31);
[ theta31, J_history31 ] = Gradientdescentmethodfinal( features31,Y,theta31,alpha,J31 );

figure()
plot(1:length(J_history31) , J_history31);

n32=length(features32(1,:));
theta32=zeros(n32,1);
for w=2:n32
    if max(abs(features32(:,w)))~=0
     features32(:,w)=(features32(:,w)-mean((features32(:,w))))./std(features32(:,w));
    end
    
end

Y=price/mean(price);

J32=costfunction(features32, Y, theta32);
[ theta32, J_history32 ] = Gradientdescentmethodfinal( features32,Y,theta32,alpha,J32 );

figure()
plot(1:length(J_history32) , J_history32);


n2=length(features2(1,:));
theta2=zeros(n2,1);

for w=2:n2
    if max(abs(features2(:,w)))~=0
     features2(:,w)=(features2(:,w)-mean((features2(:,w))))./std(features2(:,w));
    end
    
end

Y=price/mean(price);

J2=costfunction(features2, Y, theta2);
[ theta2, J_history2 ] = Gradientdescentmethodfinal( features2,Y,theta2,alpha,J2 );

figure()
plot(1:length(J_history2) , J_history2);

n21=length(features21(1,:));
theta21=zeros(n21,1);

for w=2:n21
    if max(abs(features21(:,w)))~=0
     features21(:,w)=(features21(:,w)-mean((features21(:,w))))./std(features21(:,w));
    end
    
end

Y=price/mean(price);

J21=costfunction(features21, Y, theta21);
[ theta21, J_history21 ] = Gradientdescentmethodfinal( features21,Y,theta21,alpha,J21);

figure()
plot(1:length(J_history21) , J_history21);

n22=length(features22(1,:));
theta22=zeros(n22,1);

for w=2:n22
    if max(abs(features22(:,w)))~=0
     features22(:,w)=(features22(:,w)-mean((features22(:,w))))./std(features22(:,w));
    end
    
end

Y=price/mean(price);

J22=costfunction(features22, Y, theta22);
[ theta22, J_history22 ] = Gradientdescentmethodfinal( features22,Y,theta22,alpha,J22 );

figure()
plot(1:length(J_history22) , J_history22);

n1=length(features1(1,:));
theta1=zeros(n1,1);

for w=2:n1
    if max(abs(features1(:,w)))~=0
     features1(:,w)=(features1(:,w)-mean((features1(:,w))))./std(features1(:,w));
    end
    
end

Y=price/mean(price);

J1=costfunction(features1, Y, theta1);
[ theta1, J_history1 ] = Gradientdescentmethodfinal( features1,Y,theta1,alpha,J1 );

figure()
plot(1:length(J_history1) , J_history1);


n11=length(features1(1,:));
theta11=zeros(n11,1);
for w=2:n11
    if max(abs(features11(:,w)))~=0
     features11(:,w)=(features11(:,w)-mean((features11(:,w))))./std(features11(:,w));
    end
    
end

Y=price/mean(price);

J11=costfunction(features11, Y, theta11);
[ theta11, J_history11 ] = Gradientdescentmethodfinal( features11,Y,theta11,alpha,J11 );

figure()
plot(1:length(J_history11) , J_history11);

Normaltheta=Normalization(features,price);
Normaltheta;

n12=length(features12(1,:));
theta12=zeros(n12,1);

for w=2:n12
    if max(abs(features12(:,w)))~=0
     features12(:,w)=(features12(:,w)-mean((features12(:,w))))./std(features12(:,w));
    end
    
end

Y=price/mean(price);

J12=costfunction(features12, Y, theta12);
[ theta12, J_history12 ] = Gradientdescentmethodfinal( features12,Y,theta12,alpha,J12 );

figure()
plot(1:length(J_history12) , J_history12);


n=length(features(1,:));
theta=zeros(n,1);


for w=2:n
    if max(abs(features0(:,w)))~=0
     features0(:,w)=(features0(:,w)-mean((features0(:,w))))./std(features0(:,w));
    end
    
end

Y=price/mean(price);

J=costfunction(features0, Y, theta);
[ theta, J_history ] = Gradientdescentmethodfinal( features0,Y,theta,alpha,J );

theta ;
figure()
plot(1:length(J_history) , J_history);

n01=length(features01(1,:));
theta01=zeros(n01,1);
for w=2:n01
    if max(abs(features01(:,w)))~=0
     features01(:,w)=(features01(:,w)-mean((features01(:,w))))./std(features01(:,w));
    end
    
end

Y=price/mean(price);

J01=costfunction(features01, Y, theta01);
[ theta01, J_history01 ] = Gradientdescentmethodfinal( features01,Y,theta01,alpha,J01);

n02=length(features02(1,:));
theta02=zeros(n02,1);
for w=2:n02
    if max(abs(features02(:,w)))~=0
     features02(:,w)=(features02(:,w)-mean((features02(:,w))))./std(features02(:,w));
    end
    
end

Y=price/mean(price);

j02=costfunction(features02, Y, theta02);
[ theta02, J_history02 ] = Gradientdescentmethodfinal( features02,Y,theta02,alpha,J02 );

figure()
plot(1:length(J_history12) , J_history12);

errorfinal=costfunction(features,Y,theta)
errorfinal01=costfunction( features01,Y,theta01)
errorfinal02=costfunction( features02,Y,theta02)

errorfinal1=costfunction( features1,Y,theta1)
errorfinal11=costfunction( features11,Y,theta11)
errorfinal12=costfunction( features12,Y,theta12)

errorfinal10=costfunction( features10,Y,theta1)
errorfinal111=costfunction( features111,Y,theta11)
errorfinal122=costfunction( features122,Y,theta12)

JFINAL1=costfunction( features111,Y,theta11);

errorfinal2=costfunction( features2,Y,theta2)
errorfinal21=costfunction( features21,Y,theta21)
errorfinal22=costfunction( features22,Y,theta22)

errorfinal20=costfunction( features20,Y,theta2)
errorfinal211=costfunction( features211,Y,theta21)
errorfinal222=costfunction( features222,Y,theta22)

JFINAL2=costfunction( features2220,Y,theta22);

errorfinal3=costfunction( features3,Y,theta3)
errorfinal31=costfunction( features31,Y,theta31)
errorfinal32=costfunction( features32,Y,theta32)

errorfinal30=costfunction( features30,Y,theta3)
errorfinal311=costfunction( features311,Y,theta31)
errorfinal322=costfunction( features322,Y,theta32)

JFINAL3=costfunction( features330,Y,theta3);

%predictablegp = [1, 1, 2] * theta
%predictablenp = [1, 1, 2] * Normaltheta