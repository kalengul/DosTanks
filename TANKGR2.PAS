
program pr1;
Uses Crt, Graph;

Var Gd, Gm,c : Integer;
     Color,y0,y1,y2,x1,x2 : Word;
     n,radius,l,i:integer;
     ch,ch1:char;
     s,s1,s2,s3,s4:string;
     kt,x,y,k,a0,z,kol,z1,pp:integer;
     vo,vk,bo,bk,go,gk:integer;
     v,b:array[1..2,0..50] of integer;
     g:array [1..3,0..50] of integer;

p,m:array [1..4,1..250] of integer;
procedure opengraph;
begin
Gd:=Detect;
writeln(gd);
InitGraph(Gd, Gm, 'c:\pascal\bgi');
If GraphResult <> grOk Then Halt(1);
Color:=GetMaxColor;
end;

procedure streliba (i:integer); {Танк пустил пулю перед собой}
var
z:integer;
begin
z:=1;
while p[4,z]<>0 do {}
 z:=z+1;
if m[3,i]=0 then begin p[1,z]:=m[1,i]+1; p[2,z]:=m[2,i]; end;
if m[3,i]=1 then begin p[2,z]:=m[2,i]+1; p[1,z]:=m[1,i]; end;
if m[3,i]=2 then begin p[1,z]:=m[1,i]-1; p[2,z]:=m[2,i]; end;
if m[3,i]=3 then begin p[2,z]:=m[2,i]-1; p[1,z]:=m[1,i]; end;
p[3,z]:=m[3,i]; p[4,z]:=1;
 for i:=1 to 11 do
if (m[1,i]=p[1,z]) and (m[2,i]=p[2,z]) then
              begin
              m[4,i]:=0;
              m[1,i]:=0;
              m[2,i]:=0;
              p[4,z]:=0;
              end;
               for i:=1 to bk do
    if (b[1,i]=p[1,z]) and (b[2,i]=p[2,z]) then
      p[4,z]:=0;
                    for i:=1 to gk do
    if (g[3,i]=1) and(g[1,i]=p[1,z]) and (g[2,i]=p[2,z]) then
    begin
      p[4,z]:=0;
      g[3,i]:=0;
      end;
end;

procedure tvoitank;
var
kol:integer;
begin
outtextxy(40,620,'Нажмите клавишу');
ch:=readkey;
if ch=#00 then ch:=readkey;
c:=2;
case ch of
    #27: exit;
    #75: begin m[3,1]:=m[3,1]-1;
         if m[3,1]<0 then m[3,1]:=3;
         end;
    #77: begin m[3,1]:=m[3,1]+1;
         if m[3,1]>3 then m[3,1]:=0;
          end;
    #72:  begin
          for kol:=1 to c do
          begin
          if m[3,1]=0 then m[1,1]:=m[1,1]+1;
          if m[3,1]=1 then m[2,1]:=m[2,1]+1;
          if m[3,1]=2 then m[1,1]:=m[1,1]-1;
          if m[3,1]=3 then m[2,1]:=m[2,1]-1;
            for vo:=1 to vk do
           if (m[1,1]=v[1,vo]) and (m[2,1]=v[2,vo]) then
            begin
            if m[3,1]=0 then m[1,1]:=m[1,1]-1;
            if m[3,1]=1 then m[2,1]:=m[2,1]-1;
            if m[3,1]=2 then m[1,1]:=m[1,1]+1;
            if m[3,1]=3 then m[2,1]:=m[2,1]+1;
            end;
               for vo:=1 to bk do
           if (m[1,1]=b[1,vo]) and (m[2,1]=b[2,vo]) then
            begin
            if m[3,1]=0 then m[1,1]:=m[1,1]-1;
            if m[3,1]=1 then m[2,1]:=m[2,1]-1;
            if m[3,1]=2 then m[1,1]:=m[1,1]+1;
            if m[3,1]=3 then m[2,1]:=m[2,1]+1;
            end;
                  for vo:=1 to gk do
           if (g[3,vo]=1) and(m[1,1]=g[1,vo]) and (m[2,1]=g[2,vo]) then
            begin
            if m[3,1]=0 then m[1,1]:=m[1,1]-1;
            if m[3,1]=1 then m[2,1]:=m[2,1]-1;
            if m[3,1]=2 then m[1,1]:=m[1,1]+1;
            if m[3,1]=3 then m[2,1]:=m[2,1]+1;
            end;
          for z:=1 to 250 do
          if p[4,z]=1 then
          if (m[1,1]=p[1,z]) and (m[2,1]=p[2,z]) then
              begin
              m[4,1]:=0;
              m[1,1]:=0;
              m[2,1]:=0;
              p[4,z]:=0;
              end;
              end;
          end;
    #80:  begin
          if m[3,1]=2 then m[1,1]:=m[1,1]+1;
          if m[3,1]=3 then m[2,1]:=m[2,1]+1;
          if m[3,1]=0 then m[1,1]:=m[1,1]-1;
          if m[3,1]=1 then m[2,1]:=m[2,1]-1;
            for vo:=1 to vk do
           if (m[1,1]=v[1,vo]) and (m[2,1]=v[2,vo]) then
            begin
            if m[3,1]=2 then m[1,1]:=m[1,1]-1;
            if m[3,1]=3 then m[2,1]:=m[2,1]-1;
            if m[3,1]=0 then m[1,1]:=m[1,1]+1;
            if m[3,1]=1 then m[2,1]:=m[2,1]+1;
            end;
            for vo:=1 to bk do
             if (m[1,1]=b[1,vo]) and (m[2,1]=b[2,vo]) then
            begin
            if m[3,1]=2 then m[1,1]:=m[1,1]-1;
            if m[3,1]=3 then m[2,1]:=m[2,1]-1;
            if m[3,1]=0 then m[1,1]:=m[1,1]+1;
            if m[3,1]=1 then m[2,1]:=m[2,1]+1;
            end;
             for vo:=1 to gk do
             if (g[3,vo]=1) and(m[1,1]=g[1,vo]) and (m[2,1]=g[2,vo]) then
            begin
            if m[3,1]=2 then m[1,1]:=m[1,1]-1;
            if m[3,1]=3 then m[2,1]:=m[2,1]-1;
            if m[3,1]=0 then m[1,1]:=m[1,1]+1;
            if m[3,1]=1 then m[2,1]:=m[2,1]+1;
            end;
          end;
    ' ': streliba(1);
    end;
   if m[1,1]>=20 then m[1,1]:=m[1,1]-20;
   if m[2,1]>=20 then m[2,1]:=m[2,1]-20;
   if m[1,1]<0 then m[1,1]:=m[1,1]+20;
   if m[2,1]<0 then m[2,1]:=m[2,1]+20;
end;

procedure hodprotivnica (i:integer);
var
kol:integer;
begin
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=0)then l:=1;  {1ч-Север}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=0)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=0)then l:=3;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=0)then l:=1;  {}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=1)then l:=1;  {1ч-Восток}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=1)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=1)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=1)then l:=3;  {}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=2)then l:=1;  {1ч-Юг}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=2)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=2)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=2)then l:=3;  {}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=3)then l:=2;  {1ч-Запад}
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=3)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=3)then l:=3;
if  (m[1,i]>m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=3)then l:=1;  {}

if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=0)then l:=1;  {2ч-Север}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=0)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=0)then l:=3;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=0)then l:=1;  {}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=1)then l:=2;  {2ч-Восток}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=1)then l:=2;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=1)then l:=3;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=1)then l:=1;  {}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=2)then l:=2;  {2ч-Юг}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=2)then l:=3;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=2)then l:=1;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=2)then l:=1;  {}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=3)then l:=2;  {2ч-Запад}
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=3)then l:=3;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=3)then l:=1;
if  (m[1,i]>m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=3)then l:=2;  {}

if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=0)then l:=2;  {3ч-Север}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=0)then l:=3;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=0)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=0)then l:=2;  {}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=1)then l:=3;  {3ч-Восток}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=1)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=1)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=1)then l:=2;  {}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=2)then l:=3;  {3ч-Юг}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=2)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=2)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=2)then l:=2;  {}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=0) and (m[3,1]=3)then l:=2;  {3ч-Запад}
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=1) and (m[3,1]=3)then l:=3;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=2) and (m[3,1]=3)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]<m[2,1]) and (m[3,i]=3) and (m[3,1]=3)then l:=1;  {}

if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=0)then l:=1;  {4ч-Север}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=0)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=0)then l:=2;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=0)then l:=3;  {}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=1)then l:=1;  {4ч-Восток}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=1)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=1)then l:=3;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=1)then l:=2;  {}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=2)then l:=3;  {4ч-Юг}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=2)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=2)then l:=2;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=2)then l:=2;  {}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=0) and (m[3,1]=3)then l:=3;  {4ч-Запад}
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=1) and (m[3,1]=3)then l:=1;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=2) and (m[3,1]=3)then l:=2;
if  (m[1,i]<m[1,1]) and (m[2,i]>m[2,1]) and (m[3,i]=3) and (m[3,1]=3)then l:=2;  {}

if  (m[1,i]=m[1,1]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])<=9) and (m[3,i]=1) then l:=0;  {Огонь вблизи}
if  (m[1,i]=m[1,1]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])<=9) and (m[3,i]=3) then l:=0;
if  (m[1,i]<m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[1,i]-m[2,1])<=9) and (m[3,i]=0) then l:=0;
if  (m[1,i]>m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[1,i]-m[2,1])<=9) and (m[3,i]=2) then l:=0;  {}
if  (m[1,i]=m[1,1]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (m[3,i]=1) and (m[3,1]<>3)then
l:=0;  {Огонь издали}
if  (m[1,i]=m[1,1]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (m[3,i]=3) and (m[3,1]<>1)then l:=0;
if  (m[1,i]<m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (m[3,i]=0) and (m[3,1]<>2)then l:=0;
if  (m[1,i]>m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (m[3,i]=2) and (m[3,1]<>0)then l:=0;  {}
if  (m[1,i]=m[1,1]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]=1)
and (m[3,1]=3)then  l:=random(2)+1;   {Уход от огня}
if  (m[1,i]=m[1,1]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]=3)
and (m[3,1]=1)then  l:=random(2)+1;
if  (m[1,i]<m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]=0)
and (m[3,1]=2)then  l:=random(2)+1;
if  (m[1,i]>m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]=2)
and (m[3,1]=0)then  l:=random(2)+1;
if  (m[1,i]=m[1,1]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]<>1)
and (m[3,1]=3)then l:=random(2)+2;
if  (m[1,i]=m[1,1]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]<>3)
and (m[3,1]=1)then l:=random(2)+2;
if  (m[1,i]<m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]<>0)
and (m[3,1]=2)then l:=random(2)+2;
if  (m[1,i]>m[1,1]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>9) and (abs(m[2,i]-m[2,1])<=18) and (m[3,i]<>2)
and (m[3,1]=0)then l:=random(2)+2;  {}
if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=0) and (m[3,1]=3)then l:=1;
if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=1) and (m[3,1]=3)then l:=0;
if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=2) and (m[3,1]=3)then l:=2;
if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=3) and (m[3,1]=3)then l:=3;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=0) and (m[3,1]=2)then l:=0;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=1) and (m[3,1]=2)then l:=2;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=2) and (m[3,1]=2)then l:=3;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=3) and (m[3,1]=2)then l:=1;
if  (m[1,i]<m[1,i-k]) and (m[2,i]=m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=0) and (m[3,1]=1)then l:=2;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=1) and (m[3,1]=1)then l:=3;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=2) and (m[3,1]=1)then l:=1;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=3) and (m[3,1]=1)then l:=0;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=0) and (m[3,1]=0)then l:=3;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=1) and (m[3,1]=0)then l:=1;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=2) and (m[3,1]=0)then l:=0;
if  (m[1,i]=m[1,i-k]) and (m[2,i]>m[2,1]) and (abs(m[2,i]-m[2,1])>18) and (m[3,i]=3) and (m[3,1]=0)then l:=2;
{for vo:=1 to vk do
begin
if (m[3,i]=0) and (m[1,i]=v[1,vo]+1) and (m[1,i]<=m[1,1])then l:=2;
if (m[3,i]=1) and (m[2,i]=v[2,vo]+1) and (m[2,i]<=m[2,1])then l:=2;
if (m[3,i]=2) and (m[1,i]=v[1,vo]-1) and (m[1,i]>m[1,1])then l:=2;
if (m[3,i]=3) and (m[2,i]=v[2,vo]-1) and (m[2,i]>m[2,1])then l:=2;
if (m[3,i]=0) and (m[1,i]=v[1,vo]+1) and (m[1,i]>m[1,1])then l:=1;
if (m[3,i]=1) and (m[2,i]=v[2,vo]+1) and (m[2,i]>m[2,1])then l:=1;
if (m[3,i]=2) and (m[1,i]=v[1,vo]-1) and (m[1,i]<=m[1,1])then l:=1;
if (m[3,i]=3) and (m[2,i]=v[2,vo]-1) and (m[2,i]<=m[2,1])then l:=1;
end;
for vo:=1 to bk do
begin
if (m[3,i]=0) and (m[1,i]=b[1,vo]+1) and (m[1,i]<=m[1,1])then l:=2;
if (m[3,i]=1) and (m[2,i]=b[2,vo]+1) and (m[2,i]<=m[2,1])then l:=2;
if (m[3,i]=2) and (m[1,i]=b[1,vo]-1) and (m[1,i]>m[1,1])then l:=2;
if (m[3,i]=3) and (m[2,i]=b[2,vo]-1) and (m[2,i]>m[2,1])then l:=2;
if (m[3,i]=0) and (m[1,i]=b[1,vo]+1) and (m[1,i]>m[1,1])then l:=1;
if (m[3,i]=1) and (m[2,i]=b[2,vo]+1) and (m[2,i]>m[2,1])then l:=1;
if (m[3,i]=2) and (m[1,i]=b[1,vo]-1) and (m[1,i]<=m[1,1])then l:=1;
if (m[3,i]=3) and (m[2,i]=b[2,vo]-1) and (m[2,i]<=m[2,1])then l:=1;
end;

{for vo:=1 to gk do
if(g[3,vo]=1) then
begin
 if (m[3,i]=0) and (m[1,i]=g[1,vo]+1) then l:=0;
if (m[3,i]=1) and (m[2,i]=g[2,vo]+1) then l:=0;
if (m[3,i]=2) and (m[1,i]=g[1,vo]-1) then l:=0;
if (m[3,i]=3) and (m[2,i]=g[2,vo]-1) then l:=0;
end;
{if  (m[1,i]>m[1,i-k]) and (m[2,i]=m[2,i-k]) and (abs(m[2,i]-m[2,i-k])>18) and (m[3,i]<>2) and (m[3,i-k]=0)then l:=  }{}
{1if  (m[1,i]>m[1,i-k]) and (m[2,i]<m[2,i-k]) and (m[3,i]=1) then l:=2;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]<m[2,i-k]) and (m[3,i]=2) then l:=3;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]>m[2,i-k]) and ((m[3,i]=1) or (m[3,i]=2)) then l:=1;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]>m[2,i-k]) and (m[3,i]=3) then l:=2;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]>m[2,i-k]) and (m[3,i]=0) then l:=3;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]>m[2,i-k]) and ((m[3,i]=2) or (m[3,i]=3)) then l:=1;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]>m[2,i-k]) and (m[3,i]=0) then l:=2;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]>m[2,i-k]) and (m[3,i]=1) then l:=3;
1if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,i-k]) and (m[3,i]=0) then l:=1;
1if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,i-k]) and (m[3,i]=2) then l:=random(2)+2;
1if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,i-k]) and (m[3,i]=1) then l:=2;
1if  (m[1,i]=m[1,i-k]) and (m[2,i]<m[2,i-k]) and (m[3,i]=3) then l:=3;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=2) then l:=3;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=1) then l:=random(2)+2;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=0) then l:=1;
1if  (m[1,i]>m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=3) then l:=2;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=2) then l:=2;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=3) then l:=random(2)+2;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=1) then l:=2;
1if  (m[1,i]<m[1,i-k]) and (m[2,i]=m[2,i-k]) and (m[3,i]=0) then l:=1;}
case l of
  1:m[3,i]:=m[3,i]-1;
  2:m[3,i]:=m[3,i]+1;
  3: begin
       for kol:=1 to 2 do
          begin
          if m[3,i]=0 then m[1,i]:=m[1,i]+1;
          if m[3,i]=1 then m[2,i]:=m[2,i]+1;
          if m[3,i]=2 then m[1,i]:=m[1,i]-1;
          if m[3,i]=3 then m[2,i]:=m[2,i]-1;
          for vo:=1 to vk do
           if (m[1,i]=v[1,vo]) and (m[2,i]=v[2,vo]) then
            begin
            if m[3,i]=0 then m[1,i]:=m[1,i]-1;
            if m[3,i]=1 then m[2,i]:=m[2,i]-1;
            if m[3,i]=2 then m[1,i]:=m[1,i]+1;
            if m[3,i]=3 then m[2,i]:=m[2,i]+1;
            end;
        for vo:=1 to bk do
           if (m[1,i]=b[1,vo]) and (m[2,i]=b[2,vo]) then
            begin
            if m[3,i]=0 then m[1,i]:=m[1,i]-1;
            if m[3,i]=1 then m[2,i]:=m[2,i]-1;
            if m[3,i]=2 then m[1,i]:=m[1,i]+1;
            if m[3,i]=3 then m[2,i]:=m[2,i]+1;
            end;
              for vo:=1 to gk do
           if (g[3,vo]=1) and(m[1,i]=g[1,vo]) and (m[2,i]=g[2,vo]) then
            begin
            if m[3,i]=0 then m[1,i]:=m[1,i]-1;
            if m[3,i]=1 then m[2,i]:=m[2,i]-1;
            if m[3,i]=2 then m[1,i]:=m[1,i]+1;
            if m[3,i]=3 then m[2,i]:=m[2,i]+1;
            end;

          for z:=1 to 250 do
          if p[4,z]=1 then
          if (m[1,i]=p[1,z]) and (m[2,i]=p[2,z]) then
              begin
              m[4,i]:=0;
              m[1,i]:=0;
              m[2,i]:=0;
              p[4,z]:=0;
              end;
              end;
              end;
  4: begin
     if m[3,i]=2 then m[1,i]:=m[1,i]+1;
     if m[3,i]=3 then m[2,i]:=m[2,i]+1;
     if m[3,i]=0 then m[1,i]:=m[1,i]-1;
     if m[3,i]=1 then m[2,i]:=m[2,i]-1;
      for vo:=1 to vk do
           if (m[1,i]=v[1,vo]) and (m[2,i]=v[2,vo]) then
            begin
            if m[3,i]=2 then m[1,i]:=m[1,i]-1;
            if m[3,i]=3 then m[2,i]:=m[2,i]-1;
            if m[3,i]=0 then m[1,i]:=m[1,i]+1;
            if m[3,i]=1 then m[2,i]:=m[2,i]+1;
            end;
  for vo:=1 to bk do
           if (m[1,i]=b[1,vo]) and (m[2,i]=b[2,vo]) then
            begin
            if m[3,i]=2 then m[1,i]:=m[1,i]-1;
            if m[3,i]=3 then m[2,i]:=m[2,i]-1;
            if m[3,i]=0 then m[1,i]:=m[1,i]+1;
            if m[3,i]=1 then m[2,i]:=m[2,i]+1;
            end;
              for vo:=1 to gk do
           if(g[3,vo]=1) and(m[1,i]=g[1,vo]) and (m[2,i]=g[2,vo]) then
            begin
            if m[3,i]=2 then m[1,i]:=m[1,i]-1;
            if m[3,i]=3 then m[2,i]:=m[2,i]-1;
            if m[3,i]=0 then m[1,i]:=m[1,i]+1;
            if m[3,i]=1 then m[2,i]:=m[2,i]+1;
            end;
     end;
  0: streliba(i);

end;
 if m[1,i]>=20 then m[1,i]:=m[1,i]-20;
 if m[2,i]>=20 then m[2,i]:=m[2,i]-20;
 if m[1,i]<0 then m[1,i]:=m[1,i]+20;
 if m[2,i]<0 then m[2,i]:=m[2,i]+20;
 if m[3,i]<0 then m[3,i]:=3;
 if m[3,i]>3 then m[3,i]:=0;

end;

procedure dvishenie;
var
q,z,i:integer;
begin
for q:=1 to 2 do
 for z:=1 to 250 do
  if p[4,z]=1 then
   begin
   if p[3,z]=0 then p[1,z]:=p[1,z]+1;
   if p[3,z]=1 then p[2,z]:=p[2,z]+1;
   if p[3,z]=2 then p[1,z]:=p[1,z]-1;
   if p[3,z]=3 then p[2,z]:=p[2,z]-1;
   if p[1,z]>=20 then p[1,z]:=p[1,z]-20;
   if p[2,z]>=20 then p[2,z]:=p[2,z]-20;
   if p[1,z]<0 then p[1,z]:=p[1,z]+20;
   if p[2,z]<0 then p[2,z]:=p[2,z]+20;
   for i:=1 to 11 do
    if (m[1,i]=p[1,z]) and (m[2,i]=p[2,z]) then
    begin
    m[4,i]:=0;
    m[1,i]:=0;
    m[2,i]:=0;
    p[4,z]:=0;
    end;
   for i:=1 to bk do
    if (b[1,i]=p[1,z]) and (b[2,i]=p[2,z]) then
      p[4,z]:=0;
    for i:=1 to gk do
    if (g[3,i]=1) and(g[1,i]=p[1,z]) and (g[2,i]=p[2,z]) then
    begin
    g[3,i]:=0;
      p[4,z]:=0;
      end;

   end;
end;

procedure karta;
var
j,lll:integer;
begin
for i:=1 to 20 do
begin
setcolor(15);
line(i*(560 div 20),0,i*(560 div 20),400);
line(0,i*(400 div 20),560,i*(400 div 20));
{delay(300);}
end;

for i:=1 to vk do
 begin
 setcolor(1);
 rectangle(v[1,i]*(560 div 20),v[2,i]*(400 div 20),v[1,i]*(560 div 20)+28,v[2,i]*(400 div 20)+20);
 setfillstyle(solidfill,1);
 floodfill(v[1,i]*(560 div 20)+1,v[2,i]*(400 div 20)+7,1);
 setcolor(0);
 arc(v[1,i]*(560 div 20)+4,v[2,i]*(400 div 20)+5,0,180,2);
 arc(v[1,i]*(560 div 20)+8,v[2,i]*(400 div 20)+5,180,360,2);
 arc(v[1,i]*(560 div 20)+20,v[2,i]*(400 div 20)+5,0,180,2);
 arc(v[1,i]*(560 div 20)+24,v[2,i]*(400 div 20)+5,180,360,2);
 arc(v[1,i]*(560 div 20)+12,v[2,i]*(400 div 20)+10,0,180,2);
 arc(v[1,i]*(560 div 20)+16,v[2,i]*(400 div 20)+10,180,360,2);
 arc(v[1,i]*(560 div 20)+4,v[2,i]*(400 div 20)+15,0,180,2);
 arc(v[1,i]*(560 div 20)+8,v[2,i]*(400 div 20)+15,180,360,2);
 arc(v[1,i]*(560 div 20)+20,v[2,i]*(400 div 20)+15,0,180,2);
 arc(v[1,i]*(560 div 20)+24,v[2,i]*(400 div 20)+15,180,360,2);
  end;

for i:=1 to bk do
 begin
 setcolor(15);
 rectangle(b[1,i]*(560 div 20),b[2,i]*(400 div 20),b[1,i]*(560 div 20)+28,b[2,i]*(400 div 20)+20);
 setfillstyle(solidfill,15);
 floodfill(b[1,i]*(560 div 20)+1,b[2,i]*(400 div 20)+7,15);
 setcolor(0);
 rectangle(b[1,i]*(560 div 20)+2,b[2,i]*(400 div 20)+2,b[1,i]*(560 div 20)+26,b[2,i]*(400 div 20)+18);
 rectangle(b[1,i]*(560 div 20)+4,b[2,i]*(400 div 20)+4,b[1,i]*(560 div 20)+24,b[2,i]*(400 div 20)+16);
 rectangle(b[1,i]*(560 div 20)+6,b[2,i]*(400 div 20)+6,b[1,i]*(560 div 20)+22,b[2,i]*(400 div 20)+14);
 rectangle(b[1,i]*(560 div 20)+8,b[2,i]*(400 div 20)+8,b[1,i]*(560 div 20)+20,b[2,i]*(400 div 20)+12);
 rectangle(b[1,i]*(560 div 20)+10,b[2,i]*(400 div 20)+10,b[1,i]*(560 div 20)+18,b[2,i]*(400 div 20)+10);
 end;
for i:=1 to gk do
if g[3,i]=1 then
 begin
 setcolor(6);
 rectangle(g[1,i]*(560 div 20),g[2,i]*(400 div 20),g[1,i]*(560 div 20)+28,g[2,i]*(400 div 20)+20);
 setfillstyle(solidfill,6);
 floodfill(g[1,i]*(560 div 20)+1,g[2,i]*(400 div 20)+7,6);
 setcolor(0);
 for lll:=1 to 5 do
 begin
 line(g[1,i]*(560 div 20)+round(lll*1.4*4),g[2,i]*(400 div 20),g[1,i]*(560 div 20)+round(lll*4*1.4),g[2,i]*(400 div 20)+20);
 line(g[1,i]*(560 div 20),g[2,i]*(400 div 20)+lll*4,g[1,i]*(560 div 20)+28,g[2,i]*(400 div 20)+lll*4);
 end;
 end;
for i:=1 to 5 do
begin
if i<=1 then
 begin
 k:=1;
 l:=2;
 j:=4;
 end
else
 begin
 k:=3;
 l:=5;
 j:=1;
 end;
if m[4,i]=1 then
begin
if m[3,i]=3 then
begin
setcolor(k);
rectangle(m[1,i]*(560 div 20)+8,m[2,i]*(400 div 20)+6,m[1,i]*(560 div 20)+20,m[2,i]*(400 div 20)+18);
setfillstyle(solidfill,l);
floodfill(m[1,i]*(560 div 20)+9,m[2,i]*(400 div 20)+7,k);
line(m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+6,m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+18);
line(m[1,i]*(560 div 20)+18,m[2,i]*(400 div 20)+6,m[1,i]*(560 div 20)+18,m[2,i]*(400 div 20)+18);
setcolor(j);
line(m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+2,m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+10);
circle(m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+12,2);
end;
if m[3,i]=0 then
begin
setcolor(k);
rectangle(m[1,i]*(560 div 20)+6,m[2,i]*(400 div 20)+2,m[1,i]*(560 div 20)+20,m[2,i]*(400 div 20)+18);
setfillstyle(solidfill,l);
floodfill(m[1,i]*(560 div 20)+7,m[2,i]*(400 div 20)+3,k);
line(m[1,i]*(560 div 20)+6,m[2,i]*(400 div 20)+4,m[1,i]*(560 div 20)+20,m[2,i]*(400 div 20)+4);
line(m[1,i]*(560 div 20)+6,m[2,i]*(400 div 20)+16,m[1,i]*(560 div 20)+20,m[2,i]*(400 div 20)+16);
setcolor(j);
line(m[1,i]*(560 div 20)+24,m[2,i]*(400 div 20)+10,m[1,i]*(560 div 20)+16,m[2,i]*(400 div 20)+10);
circle(m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+10,2);
end;
if m[3,i]=2 then
begin
setcolor(k);
rectangle(m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+2,m[1,i]*(560 div 20)+24,m[2,i]*(400 div 20)+18);
setfillstyle(solidfill,l);
floodfill(m[1,i]*(560 div 20)+11,m[2,i]*(400 div 20)+3,k);
line(m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+4,m[1,i]*(560 div 20)+24,m[2,i]*(400 div 20)+4);
line(m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+16,m[1,i]*(560 div 20)+24,m[2,i]*(400 div 20)+16);
setcolor(j);
line(m[1,i]*(560 div 20)+4,m[2,i]*(400 div 20)+10,m[1,i]*(560 div 20)+16,m[2,i]*(400 div 20)+10);
circle(m[1,i]*(560 div 20)+18,m[2,i]*(400 div 20)+10,2);
end;
if m[3,i]=1 then
begin
setcolor(k);
rectangle(m[1,i]*(560 div 20)+8,m[2,i]*(400 div 20)+2,m[1,i]*(560 div 20)+20,m[2,i]*(400 div 20)+14);
setfillstyle(solidfill,l);
floodfill(m[1,i]*(560 div 20)+9,m[2,i]*(400 div 20)+7,k);
line(m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+2,m[1,i]*(560 div 20)+10,m[2,i]*(400 div 20)+14);
line(m[1,i]*(560 div 20)+18,m[2,i]*(400 div 20)+2,m[1,i]*(560 div 20)+18,m[2,i]*(400 div 20)+14);
setcolor(j);
line(m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+10,m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+18);
circle(m[1,i]*(560 div 20)+14,m[2,i]*(400 div 20)+8,2);
end;
end;
end;
{delay(2000);}
for z:=1 to 250 do
if p[4,z]=1 then
 begin
 setcolor(4);
 if p[3,z]=2 then
  begin
  line(p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+14);
  line(p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+22,p[2,z]*(400 div 20)+8);
  line(p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+14,p[1,z]*(560 div 20)+22,p[2,z]*(400 div 20)+12);
  line(p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+10,p[1,z]*(560 div 20)+22,p[2,z]*(400 div 20)+10);
  rectangle(p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+8,p[1,z]*(560 div 20)+6,p[2,z]*(400 div 20)+12);
  line(p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+8);
  line(p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+12,p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+14);
  line(p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+8);
  line(p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+14,p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+12);
  line(p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+10,p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+10);
  line(p[1,z]*(560 div 20)+6,p[2,z]*(400 div 20)+8,p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+10);
  line(p[1,z]*(560 div 20)+6,p[2,z]*(400 div 20)+12,p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+10);

  end;
 if p[3,z]=1 then
 begin
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+0,p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+0);
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+0,p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+2);
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+7,p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+7);
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+7,p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+9);
  rectangle(p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+0,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+16);
  line(p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+16,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+18);
  line(p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+7,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+9);
  line(p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+0,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+2);
  line(p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+16,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+18);
  line(p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+0,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+2);
  line(p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+7,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+7);
  line(p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+7,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+9);
  end;
 if p[3,z]=0 then
 begin
  line(p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+14);
  line(p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+6,p[2,z]*(400 div 20)+8);
  line(p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+14,p[1,z]*(560 div 20)+6,p[2,z]*(400 div 20)+12);
  line(p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+10,p[1,z]*(560 div 20)+6,p[2,z]*(400 div 20)+10);
  rectangle(p[1,z]*(560 div 20)+4,p[2,z]*(400 div 20)+8,p[1,z]*(560 div 20)+22,p[2,z]*(400 div 20)+12);
  line(p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+8);
  line(p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+12,p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+14);
  line(p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+6,p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+8);
  line(p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+14,p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+12);
  line(p[1,z]*(560 div 20)+15,p[2,z]*(400 div 20)+10,p[1,z]*(560 div 20)+17,p[2,z]*(400 div 20)+10);
  line(p[1,z]*(560 div 20)+22,p[2,z]*(400 div 20)+8,p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+10);
  line(p[1,z]*(560 div 20)+22,p[2,z]*(400 div 20)+12,p[1,z]*(560 div 20)+24,p[2,z]*(400 div 20)+10);
  end;
 if p[3,z]=3 then
 begin
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+11,p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+11);
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+11,p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+9);
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+20,p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+20);
  line(p[1,z]*(560 div 20)+10,p[2,z]*(400 div 20)+20,p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+18);
  rectangle(p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+4,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+20);
  line(p[1,z]*(560 div 20)+12,p[2,z]*(400 div 20)+4,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+2);
  line(p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+9,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+11);
  line(p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+18,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+20);
  line(p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+4,p[1,z]*(560 div 20)+14,p[2,z]*(400 div 20)+2);
  line(p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+11,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+11);
  line(p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+11,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+9);
  line(p[1,z]*(560 div 20)+18,p[2,z]*(400 div 20)+20,p[1,z]*(560 div 20)+16,p[2,z]*(400 div 20)+18);
  end;
 end;
end;

procedure nat;
var
kol1:real;
begin
writeln('Введите координаты игрока');
readln(m[1,1],m[2,1]);
m[3,1]:=0;
m[4,1]:=1;
for i:=2 to 5 do
 begin
 m[4,i]:=1;
 m[1,i]:=random(20);
 m[2,i]:=random(20);
 m[3,i]:=0;
 end;
vk:=random(15);
for vo:=1 to vk do
 begin
 v[1,vo]:=random(20);
 v[2,vo]:=random(20);
 end;
repeat
kol1:=0;
for i:=1 to 5 do
for vo:=1 to vk do
if (m[1,i]=v[1,vo]) and (m[2,i]=v[2,vo]) then
begin
 v[1,vo]:=random(20);
 v[2,vo]:=random(20);
end
else
kol1:=kol1+1;
until kol1>=vk*5;
kol1:=0;
bk:=random(10);
for bo:=1 to bk do
 begin
 b[1,bo]:=random(20);
 b[2,bo]:=random(20);
 end;
repeat
kol1:=0;
for i:=1 to 5 do
for bo:=1 to bk do
if (m[1,i]=b[1,bo]) and (m[2,i]=b[2,bo]) then
begin
 b[1,bo]:=random(20);
 b[2,bo]:=random(20);
end
else
kol1:=kol1+1;
until kol1>=bk*5;
gk:=random(15);
for go:=1 to gk do
 begin
 g[3,go]:=1;
 g[1,go]:=random(20);
 g[2,go]:=random(20);
 end;
repeat
kol1:=0;
for i:=1 to 5 do
for go:=1 to gk do
if (m[1,i]=g[1,go]) and (m[2,i]=g[2,go]) then
begin
 g[1,go]:=random(20);
 g[2,go]:=random(20);
end
else
kol1:=kol1+1;
until kol1>=gk*5;

writeln(bk,'  ',vk,'  ',gk);
{readln;    }
end;

Begin
randomize;
nat;
opengraph;
repeat
for i:=2 to 5 do
if m[4,i]=0 then
 begin
 m[4,i]:=1;
 m[1,i]:=random(20);
 m[2,i]:=random(20);
 m[3,i]:=0;
 kt:=kt+1;
 end;
if m[4,1]=1 then
begin
cleardevice;
karta;
outtextxy(40,600,'Ходит игрок');
tvoitank;
karta;
cleardevice;
end;
for pp:=2 to 5 do
if m[4,pp]=1 then
 hodprotivnica (pp);
dvishenie;
karta;
delay(100);
cleardevice;
until (ch=#27) or(m[4,1]=0) ;
cleardevice;
setcolor(15);
str(kt,s);
outtextxy(50,50,'Ты подбил '+s+' танков противника');
delay(5000);
outtextxy(50,100,'Нажмите любую клавишу');
repeat
until keypressed;
closegraph;
end.