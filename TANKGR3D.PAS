program pr1;
Uses Crt, Graph;

Var Gd, Gm : integer;
     Color,y0,y1,y2,x1,x2 : Word;
     bk,vk,gk,kt,i,pp,z,sn,kp,xd:byte;
     ch:char;
     s:string[2];
     bon:array [1..4,1..150] of byte;
     v,b:array[1..2,0..150] of byte;
     g:array [1..3,0..150] of byte;
m:array [1..11,1..5] of integer;
mt:array [1..11,1..5] of byte;
r:array[1..5,1..20] of byte;
p:array [1..4,1..150] of integer;
Procedure OpenGraph;
Var grDriver : Integer;
      grMode : Integer;
     ErrCode : Integer;

Begin
 grDriver:=Detect;
 InitGraph(grDriver, grMode, '');
 ErrCode:=GraphResult;
 If ErrCode <> grOk Then
   begin
   WriteLn('Ошибка инициализации графики:', GraphErrorMsg(ErrCode));
   readln;
   end;
End;

procedure streliba (i:byte); {Танк пустил пулю перед собой}
var
z:byte;
begin
z:=1;
while (p[4,z]<>0)and (z<=150) do {}
 z:=z+1;
if m[3,i]=0 then begin p[1,z]:=m[1,i]+1; p[2,z]:=m[2,i]; end;
if m[3,i]=1 then begin p[2,z]:=m[2,i]+1; p[1,z]:=m[1,i]; end;
if m[3,i]=2 then begin p[1,z]:=m[1,i]-1; p[2,z]:=m[2,i]; end;
if m[3,i]=3 then begin p[2,z]:=m[2,i]-1; p[1,z]:=m[1,i]; end;
p[3,z]:=m[3,i]; p[4,z]:=1;
 for i:=1 to 5 do
if (m[1,i]=p[1,z]) and (m[2,i]=p[2,z]) then
              begin
               m[5,i]:=m[5,i]-1;
              if m[5,i]<=0 then
              begin
              m[4,i]:=0;
              m[1,i]:=0;
              m[2,i]:=0;
              end;
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
             for i:=1 to kp do
      if (r[1,i]=p[1,z]) and (r[2,i]=p[2,z]) then
      p[4,z]:=0;

end;

procedure tvoitank;
var
kol,c,vo,z:byte;
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
           if m[1,i]>=20 then m[1,i]:=m[1,i]-20;
 if m[2,i]>=20 then m[2,i]:=m[2,i]-20;
 if m[1,i]<0 then m[1,i]:=m[1,i]+20;
 if m[2,i]<0 then m[2,i]:=m[2,i]+20;

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
            for vo:=2 to 5 do
           if (m[1,1]=m[1,vo]) and (m[2,1]=m[2,vo]) then
            begin
            if m[3,1]=0 then m[1,1]:=m[1,1]-1;
            if m[3,1]=1 then m[2,1]:=m[2,1]-1;
            if m[3,1]=2 then m[1,1]:=m[1,1]+1;
            if m[3,1]=3 then m[2,1]:=m[2,1]+1;
            end;
          for z:=1 to 150 do
          if p[4,z]=1 then
          if (m[1,1]=p[1,z]) and (m[2,1]=p[2,z]) then
              begin
              p[4,z]:=0;
                m[5,i]:=m[5,i]-1;
              if m[5,i]<=0 then
              begin
              m[4,i]:=0;
              m[1,i]:=0;
              m[2,i]:=0;
              end;
               end;
               for z:=1 to 150 do
          if bon[4,z]=1 then
          if (m[1,1]=bon[1,z]) and (m[2,1]=bon[2,z]) then
           begin
            m[5+bon[3,z],1]:=1;
            bon[4,z]:=0;
            end;
                if m[1,1]>=20 then m[1,1]:=m[1,1]-20;
   if m[2,1]>=20 then m[2,1]:=m[2,1]-20;
   if m[1,1]<0 then m[1,1]:=m[1,1]+20;
   if m[2,1]<0 then m[2,1]:=m[2,1]+20;
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
               for vo:=2 to 5 do
             if (m[1,1]=m[1,vo]) and (m[2,1]=m[2,vo]) then
            begin
            if m[3,1]=2 then m[1,1]:=m[1,1]-1;
            if m[3,1]=3 then m[2,1]:=m[2,1]-1;
            if m[3,1]=0 then m[1,1]:=m[1,1]+1;
            if m[3,1]=1 then m[2,1]:=m[2,1]+1;
            end;
            for z:=1 to 150 do
          if bon[4,z]=1 then
          if (m[1,1]=bon[1,z]) and (m[2,1]=bon[2,z]) then
           begin
            m[5+bon[3,z],1]:=1;
            bon[4,z]:=0;
            end;
              if m[1,1]>=20 then m[1,1]:=m[1,1]-20;
   if m[2,1]>=20 then m[2,1]:=m[2,1]-20;
   if m[1,1]<0 then m[1,1]:=m[1,1]+20;
   if m[2,1]<0 then m[2,1]:=m[2,1]+20;
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
kol,l,vo,k,bo,z:byte;
begin
l:=random(4)+1;
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

for vo:=1 to vk do
begin
if (m[3,i]=0) and (m[2,i]=v[2,vo])and (m[1,i]+1=v[1,vo]) and (m[1,i]<=m[1,1])then l:=2;
if (m[3,i]=1) and (m[1,i]=v[1,vo])and (m[2,i]+1=v[2,vo]) and (m[2,i]<=m[2,1])then l:=2;
if (m[3,i]=2) and (m[2,i]=v[2,vo])and (m[1,i]-1=v[1,vo]) and (m[1,i]>m[1,1])then l:=2;
if (m[3,i]=3) and (m[1,i]=v[1,vo])and (m[2,i]-1=v[2,vo]) and (m[2,i]>m[2,1])then l:=2;
if (m[3,i]=0) and (m[2,i]=v[2,vo])and (m[1,i]+1=v[1,vo]) and (m[1,i]>m[1,1])then l:=1;
if (m[3,i]=1) and (m[1,i]=v[1,vo])and (m[2,i]+1=v[2,vo]) and (m[2,i]>m[2,1])then l:=1;
if (m[3,i]=2) and (m[2,i]=v[2,vo])and (m[1,i]-1=v[1,vo]) and (m[1,i]<=m[1,1])then l:=1;
if (m[3,i]=3) and (m[1,i]=v[1,vo])and (m[2,i]-1=v[2,vo]) and (m[2,i]<=m[2,1])then l:=1;
end;
for vo:=1 to bk do
begin
if (m[3,i]=0) and (m[2,i]=b[2,vo])and (m[1,i]+1=b[1,vo]) and (m[1,i]<=m[1,1])then l:=2;
if (m[3,i]=1) and (m[1,i]=b[1,vo])and (m[2,i]+1=b[2,vo]) and (m[2,i]<=m[2,1])then l:=2;
if (m[3,i]=2) and (m[2,i]=b[2,vo])and (m[1,i]-1=b[1,vo]) and (m[1,i]>m[1,1])then l:=2;
if (m[3,i]=3) and (m[1,i]=b[1,vo])and (m[2,i]-1=b[2,vo]) and (m[2,i]>m[2,1])then l:=2;
if (m[3,i]=0) and (m[2,i]=b[2,vo])and (m[1,i]+1=b[1,vo]) and (m[1,i]>m[1,1])then l:=1;
if (m[3,i]=1) and (m[1,i]=b[1,vo])and (m[2,i]+1=b[2,vo]) and (m[2,i]>m[2,1])then l:=1;
if (m[3,i]=2) and (m[2,i]=b[2,vo])and (m[1,i]-1=b[1,vo]) and (m[1,i]<=m[1,1])then l:=1;
if (m[3,i]=3) and (m[1,i]=b[1,vo])and (m[2,i]-1=b[2,vo]) and (m[2,i]<=m[2,1])then l:=1;
end;

for vo:=1 to gk do
if(g[3,vo]=1) then
begin
if (m[3,i]=0) and (m[2,i]=g[2,vo]) and (m[1,i]+1=g[1,vo]) then l:=0;
if (m[3,i]=1) and (m[1,i]=g[1,vo]) and (m[2,i]+1=g[2,vo]) then l:=0;
if (m[3,i]=2) and (m[2,i]=g[2,vo]) and (m[1,i]-1=g[1,vo]) then l:=0;
if (m[3,i]=3) and (m[1,i]=g[1,vo]) and (m[2,i]-1=g[2,vo]) then l:=0;
end;
if (m[3,i]=0)and(m[2,1]=m[2,i])  then
for k:=m[1,i]+1 to m[1,1] do
begin
 for bo:=1 to bk do
 if (k=b[1,bo]) and (m[2,i]=b[2,bo]) then l:=2;
 for z:=2 to 5 do
  if (k=m[1,z])and (m[2,i]=m[2,z]) then l:=2;
  end;

if (m[3,i]=2)and(m[2,1]=m[2,i])  then
for k:=m[1,i]-1 downto m[1,1] do
begin
 for bo:=1 to bk do
 if (k=b[1,bo]) and (m[2,i]=b[2,bo]) then l:=2;
 for z:=2 to 5 do
  if (k=m[1,z])and (m[2,i]=m[2,z]) then l:=2;
  end;

if (m[3,i]=1)and(m[1,1]=m[1,i])  then
for k:=m[2,i]+1 to m[2,1] do
begin
 for bo:=1 to bk do
 if (k=b[2,bo]) and (m[1,i]=b[1,bo]) then l:=2;
 for z:=2 to 5 do
  if (k=m[2,z])and (m[1,i]=m[1,z]) then l:=2;
  end;
if (m[3,i]=3)and(m[1,1]=m[1,i])  then
for k:=m[2,i]-1 downto m[2,1] do
begin
 for bo:=1 to bk do
 if (k=b[2,bo]) and (m[1,i]=b[1,bo]) then l:=2;
 for z:=2 to 5 do
  if (k=m[2,z])and (m[1,i]=m[1,z]) then l:=2;
  end;

if (m[3,i]=1)and(m[2,1]=m[2,i])  then
for k:=m[1,i]+1 to m[1,1] do
begin
 for bo:=1 to bk do
 if (k=b[1,bo]) and (m[2,i]=b[2,bo]) then l:=3;
 for z:=2 to 5 do
  if (k=m[1,z])and (m[2,i]=m[2,z]) then l:=3;
  end;

if (m[3,i]=3)and(m[2,1]=m[2,i])  then
for k:=m[1,i]-1 downto m[1,1] do
begin
 for bo:=1 to bk do
 if (k=b[1,bo]) and (m[2,i]=b[2,bo]) then l:=3;
 for z:=2 to 5 do
  if (k=m[1,z])and (m[2,i]=m[2,z]) then l:=3;
  end;

if (m[3,i]=2)and(m[1,1]=m[1,i])  then
for k:=m[2,i]+1 to m[2,1] do
begin
 for bo:=1 to bk do
 if (k=b[2,bo]) and (m[1,i]=b[1,bo]) then l:=3;
 for z:=2 to 5 do
  if (k=m[2,z])and (m[1,i]=m[1,z]) then l:=3;
  end;
if (m[3,i]=0)and(m[1,1]=m[1,i])  then
for k:=m[2,i]-1 downto m[2,1] do
begin
 for bo:=1 to bk do
 if (k=b[2,bo]) and (m[1,i]=b[1,bo]) then l:=3;
 for z:=2 to 5 do
  if (k=m[2,z])and (m[1,i]=m[1,z]) then l:=3;
  end;
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
           if m[1,i]>=20 then m[1,i]:=m[1,i]-20;
 if m[2,i]>=20 then m[2,i]:=m[2,i]-20;
 if m[1,i]<0 then m[1,i]:=m[1,i]+20;
 if m[2,i]<0 then m[2,i]:=m[2,i]+20;

          for vo:=1 to vk do
           if (m[1,i]=v[1,vo]) and (m[2,i]=v[2,vo]) then
            begin
            if m[3,i]=0 then m[1,i]:=m[1,i]-1;
            if m[3,i]=1 then m[2,i]:=m[2,i]-1;
            if m[3,i]=2 then m[1,i]:=m[1,i]+1;
            if m[3,i]=3 then m[2,i]:=m[2,i]+1;
            end;
          for vo:=1 to 5 do
          if (m[1,i]=m[1,vo]) and (m[2,i]=m[2,vo]) and (vo<>i) then
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

          for z:=1 to 150 do
          if p[4,z]=1 then
          if (m[1,i]=p[1,z]) and (m[2,i]=p[2,z]) then
              begin
            m[5,i]:=m[5,i]-1;
              if m[5,i]<=0 then
              begin
              m[4,i]:=0;
              m[1,i]:=0;
              m[2,i]:=0;
              end;
              p[4,z]:=0;
              end;
              for vo:=1 to 5 do
              if i<>vo then
             if (m[1,vo]=m[1,i]) and (m[2,vo]=m[2,i]) then
            begin
            if m[3,i]=2 then m[1,i]:=m[1,i]-1;
            if m[3,i]=3 then m[2,i]:=m[2,i]-1;
            if m[3,i]=0 then m[1,i]:=m[1,i]+1;
            if m[3,i]=1 then m[2,i]:=m[2,i]+1;
            end;
            for z:=1 to 150 do
          if bon[4,z]=1 then
          if (m[1,i]=bon[1,z]) and (m[2,i]=bon[2,z]) then
           begin
            m[5+bon[3,z],i]:=1;
            bon[4,z]:=0;
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
       for vo:=1 to 5 do
          if (m[1,i]=m[1,vo]) and (m[2,i]=m[2,vo]) and (vo<>i) then
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
               for vo:=1 to 5 do
              if i<>vo then
             if (m[1,vo]=m[1,i]) and (m[2,vo]=m[2,i]) then
            begin
            if m[3,i]=0 then m[1,i]:=m[1,i]-1;
            if m[3,i]=1 then m[2,i]:=m[2,i]-1;
            if m[3,i]=2 then m[1,i]:=m[1,i]+1;
            if m[3,i]=3 then m[2,i]:=m[2,i]+1;
            end;
          for z:=1 to 150 do
          if bon[4,z]=1 then
          if (m[1,i]=bon[1,z]) and (m[2,i]=bon[2,z]) then
           begin
            m[5+bon[3,z],i]:=1;
            bon[4,z]:=0;
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
z,q,i:byte;
begin
for q:=1 to 2 do
 for z:=1 to 150 do
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
   for i:=1 to 5 do
    if (m[1,i]=p[1,z]) and (m[2,i]=p[2,z]) then
    begin
   m[5,i]:=m[5,i]-1;
              if m[5,i]<=0 then
              begin
              m[4,i]:=0;
              m[1,i]:=0;
              m[2,i]:=0;
              end;
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
       for i:=1 to kp do
      if (r[1,i]=p[1,z]) and (r[2,i]=p[2,z]) then
      p[4,z]:=0;
   end;
end;

procedure karta;
var
j,lll,k,l:byte;
s:string[2];
begin
setcolor(4);
str(m[5,1],s);
outtextxy(20,410,'Жизни игрока - '+s);
str(m[5,2],s);
outtextxy(20,420,'Жизни противника №1 - '+s);
str(m[5,3],s);
outtextxy(20,430,'Жизни противника №2 - '+s);
str(m[5,4],s);
outtextxy(20,440,'Жизни противника №3 - '+s);
str(m[5,5],s);
outtextxy(20,450,'Жизни противника №4 - '+s);

for i:=1 to 150 do
if bon[4,i]=1 then
 begin
  if bon[3,i]=1 then
  begin
  setcolor(3);

  end;
 end;

for i:=1 to 5 do
 begin
 if i=1 then
 setcolor(6)
 else
 setcolor(13);
 rectangle(mt[1,i]*(560 div 20)+2,mt[2,i]*(400 div 20)+2,mt[1,i]*(560 div 20)+26,mt[2,i]*(400 div 20)+18);
 rectangle(mt[1,i]*(560 div 20)+4,mt[2,i]*(400 div 20)+4,mt[1,i]*(560 div 20)+24,mt[2,i]*(400 div 20)+16);
 if i<>1 then
 begin
 str(i-1,s);
 outtextxy(mt[1,i]*(560 div 20)+12,mt[2,i]*(400 div 20)+8,s);
 end;
 end;

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
for i:=1 to kp do
 begin
 setcolor(2);
 if r[3,i]=0 then
 begin
 rectangle(r[1,i]*(560 div 20)+6,r[2,i]*(400 div 20)+9,r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+13);
 rectangle(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+7,r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+9);
 rectangle(r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+4,r[1,i]*(560 div 20)+14,r[2,i]*(400 div 20)+16);
 rectangle(r[1,i]*(560 div 20)+14,r[2,i]*(400 div 20)+9,r[1,i]*(560 div 20)+22,r[2,i]*(400 div 20)+11);
 line(r[1,i]*(560 div 20)+2,r[2,i]*(400 div 20)+2,r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+7);
 line(r[1,i]*(560 div 20)+2,r[2,i]*(400 div 20)+3,r[1,i]*(560 div 20)+12,r[2,i]*(400 div 20)+7);
 line(r[1,i]*(560 div 20)+2,r[2,i]*(400 div 20)+17,r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+13);
 line(r[1,i]*(560 div 20)+2,r[2,i]*(400 div 20)+18,r[1,i]*(560 div 20)+12,r[2,i]*(400 div 20)+13);
 end;
 if r[3,i]=1 then
 begin
 rectangle(r[1,i]*(560 div 20)+12,r[2,i]*(400 div 20)+16,r[1,i]*(560 div 20)+14,r[2,i]*(400 div 20)+12);
 rectangle(r[1,i]*(560 div 20)+6,r[2,i]*(400 div 20)+11,r[1,i]*(560 div 20)+22,r[2,i]*(400 div 20)+12);
 rectangle(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+11,r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+7);
 rectangle(r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+11,r[1,i]*(560 div 20)+16,r[2,i]*(400 div 20)+8);
 line(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+11,r[1,i]*(560 div 20)+2,r[2,i]*(400 div 20)+2);
 line(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+10,r[1,i]*(560 div 20)+3,r[2,i]*(400 div 20)+2);
 line(r[1,i]*(560 div 20)+16,r[2,i]*(400 div 20)+11,r[1,i]*(560 div 20)+25,r[2,i]*(400 div 20)+2);
 line(r[1,i]*(560 div 20)+16,r[2,i]*(400 div 20)+10,r[1,i]*(560 div 20)+26,r[2,i]*(400 div 20)+2);
 end;
 if r[3,i]=2 then
 begin
 rectangle(r[1,i]*(560 div 20)+28-6,r[2,i]*(400 div 20)+20-9,r[1,i]*(560 div 20)+28-13,r[2,i]*(400 div 20)+20-13);
 rectangle(r[1,i]*(560 div 20)+28-10,r[2,i]*(400 div 20)+20-7,r[1,i]*(560 div 20)+28-13,r[2,i]*(400 div 20)+20-9);
 rectangle(r[1,i]*(560 div 20)+28-13,r[2,i]*(400 div 20)+20-4,r[1,i]*(560 div 20)+28-14,r[2,i]*(400 div 20)+20-16);
 rectangle(r[1,i]*(560 div 20)+28-14,r[2,i]*(400 div 20)+20-9,r[1,i]*(560 div 20)+28-22,r[2,i]*(400 div 20)+20-11);
 line(r[1,i]*(560 div 20)+28-2,r[2,i]*(400 div 20)+20-2,r[1,i]*(560 div 20)+28-13,r[2,i]*(400 div 20)+20-7);
 line(r[1,i]*(560 div 20)+28-2,r[2,i]*(400 div 20)+20-3,r[1,i]*(560 div 20)+28-12,r[2,i]*(400 div 20)+20-7);
 line(r[1,i]*(560 div 20)+28-2,r[2,i]*(400 div 20)+20-17,r[1,i]*(560 div 20)+28-13,r[2,i]*(400 div 20)+20-13);
 line(r[1,i]*(560 div 20)+28-2,r[2,i]*(400 div 20)+20-18,r[1,i]*(560 div 20)+28-12,r[2,i]*(400 div 20)+20-13);
 end;
 if r[3,i]=3 then
 begin
 rectangle(r[1,i]*(560 div 20)+12,r[2,i]*(400 div 20)+4,r[1,i]*(560 div 20)+14,r[2,i]*(400 div 20)+11);
 rectangle(r[1,i]*(560 div 20)+6,r[2,i]*(400 div 20)+11,r[1,i]*(560 div 20)+22,r[2,i]*(400 div 20)+12);
 rectangle(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+12,r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+16);
 rectangle(r[1,i]*(560 div 20)+13,r[2,i]*(400 div 20)+12,r[1,i]*(560 div 20)+16,r[2,i]*(400 div 20)+14);
 line(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+12,r[1,i]*(560 div 20)+2,r[2,i]*(400 div 20)+18);
 line(r[1,i]*(560 div 20)+10,r[2,i]*(400 div 20)+13,r[1,i]*(560 div 20)+3,r[2,i]*(400 div 20)+18);
 line(r[1,i]*(560 div 20)+16,r[2,i]*(400 div 20)+12,r[1,i]*(560 div 20)+25,r[2,i]*(400 div 20)+18);
 line(r[1,i]*(560 div 20)+16,r[2,i]*(400 div 20)+13,r[1,i]*(560 div 20)+26,r[2,i]*(400 div 20)+18);
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
for z:=1 to 150 do
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

procedure Fail_polia (s:string);
var
f1:text;
s1:string[2];
p:byte;
z:integer;
begin
assign(f1,s);
reset(f1);
bk:=0;
vk:=0;
gk:=0;
repeat      {Вода}
readln(f1,s);
if s<>' ' then
 begin
 vk:=vk+1;
 s1:=copy(s,1,2);
 val(s1,p,z);
 v[1,vk]:=p;
 s1:=copy(s,4,2);
 val(s1,p,z);
 v[2,vk]:=p;
 end;
until s=' ';
repeat      {Бетон}
readln(f1,s);
if s<>' ' then
 begin
 bk:=bk+1;
 s1:=copy(s,1,2);
 val(s1,p,z);
 b[1,bk]:=p;
 s1:=copy(s,4,2);
 val(s1,p,z);
 b[2,bk]:=p;
 end;
until s=' ';
repeat      {Кирпичи}
readln(f1,s);
if s<>' ' then
 begin
 gk:=gk+1;
 s1:=copy(s,1,2);
 val(s1,p,z);
 g[1,gk]:=p;
 s1:=copy(s,4,2);
 val(s1,p,z);
 g[2,gk]:=p;
 g[3,gk]:=1;
 end;
until s=' ';
close(f1);
end;

procedure fail_igroka (s:string);
var
f1:text;
i:byte;
s1:string[2];
pl:byte;
z:integer;
begin
assign(f1,s);
reset(f1);
for i:=1 to 5 do    {Танки}
begin
readln(f1,s);
 s1:=copy(s,1,2);
 val(s1,pl,z);
 mt[1,i]:=pl;
 s1:=copy(s,4,2);
 val(s1,pl,z);
 mt[2,i]:=pl;
 s1:=s[7];
 val(s1,pl,z);
 mt[3,i]:=pl;
 s1:=s[9];
 val(s1,pl,z);
 mt[5,i]:=pl;
 m[1,i]:=mt[1,i];
 m[2,i]:=mt[2,i];
 m[3,i]:=mt[3,i];
 m[5,i]:=mt[5,i];
 m[4,i]:=1;
end;
readln(f1,s);
kp:=0;
repeat            {Пушки}
readln(f1,s);
if s<>' ' then
 begin
 kp:=kp+1;
 s1:=copy(s,1,2);
 val(s1,pl,z);
 r[1,kp]:=pl;
 s1:=copy(s,4,2);
 val(s1,pl,z);
 r[2,kp]:=pl;
 s1:=s[7];
 val(s1,pl,z);
 r[3,kp]:=pl;
 s1:=copy(s,9,2);
 val(s1,pl,z);
 r[4,kp]:=pl;
 end
 else
 exit;
until s=' ';
close(f1);
end;

procedure fail;
var
f:text;
s:string[12];
begin
clrscr;
writeln('Введите название карты');
readln(s);
s:=s+'.txt';
assign(f,s);
reset(f);
readln(f,s);
Fail_polia(s);
readln(f,s);
fail_igroka(s);
close(f);
end;

procedure pushka;
var
rl,i:integer;
begin
for i:=1 to kp do
if r[5,i]=r[4,i] then
 begin
 r[5,i]:=0;
 z:=1;
 while (p[4,z]<>0) and (z<=150) do {}
 z:=z+1;
if r[3,i]=0 then begin p[1,z]:=r[1,i]+1; p[2,z]:=r[2,i]; end;
if r[3,i]=1 then begin p[2,z]:=r[2,i]+1; p[1,z]:=r[1,i]; end;
if r[3,i]=2 then begin p[1,z]:=r[1,i]-1; p[2,z]:=r[2,i]; end;
if r[3,i]=3 then begin p[2,z]:=r[2,i]-1; p[1,z]:=r[1,i]; end;
p[3,z]:=r[3,i]; p[4,z]:=1;
 for rl:=1 to 5 do
if (m[1,rl]=p[1,z]) and (m[2,rl]=p[2,z]) then
              begin
               m[5,rl]:=m[5,rl]-1;
              if m[5,rl]<=0 then
              begin
              m[4,rl]:=0;
              m[1,rl]:=0;
              m[2,rl]:=0;
              end;
              p[4,z]:=0;
              end;
               for rl:=1 to bk do
    if (b[1,rl]=p[1,z]) and (b[2,rl]=p[2,z]) then
      p[4,z]:=0;
                    for rl:=1 to gk do
    if (g[3,rl]=1) and(g[1,rl]=p[1,z]) and (g[2,rl]=p[2,z]) then
    begin
      p[4,z]:=0;
      g[3,rl]:=0;
      end;
            for rl:=1 to kp do
      if (r[1,rl]=p[1,z]) and (r[2,rl]=p[2,z]) then
      p[4,z]:=0;
 end
else
r[5,i]:=r[5,i]+1;
end;

procedure bonusi;
var
z:byte;
begin
xd:=xd+1;
if xd=10 then
 begin
 xd:=0;
 z:=1;
 while (bon[4,z]<>0) and (z<=150) do
 z:=z+1;
 bon[4,z]:=1;
 bon[1,z]:=random(20);
 bon[2,z]:=random(20);
 bon[3,z]:=random(20);
 end;
end;

Begin
randomize;
fail;
sn:=0;
for z:=1 to 150 do
 p[4,z]:=0;
opengraph;
for i:=1 to 5 do
 begin
 m[4,i]:=1;
 m[1,i]:=mt[1,i];
 m[2,i]:=mt[2,i];
 m[3,i]:=mt[3,i];
 m[5,i]:=mt[5,i];
 end;
 xd:=0;
kt:=0;
repeat
for i:=2 to 5 do
if m[4,i]=0 then
 begin
 m[4,i]:=1;
 m[1,i]:=mt[1,i];
 m[2,i]:=mt[2,i];
 m[3,i]:=mt[3,i];
 m[5,i]:=mt[5,i];
 kt:=kt+1;
 end;
cleardevice;
karta;
tvoitank;
for pp:=2 to 5 do
if m[4,pp]=1 then
 hodprotivnica (pp);
pushka;
bonusi;
dvishenie;
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