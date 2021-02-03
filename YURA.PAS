unit yura;

interface
uses graph,crt;

type
mass =array [1..10,1..100] of integer;

procedure opengraph;
procedure tck(var m,m1:mass;i,j:integer);
procedure perevod (var st:string);
procedure vvod (st:string; var a:real);
procedure vvodg (var p:real; x,y:integer);
procedure vivodg(n:real; st:string; x,y:integer);
procedure zapf (st:string;n:real;  var f:text);

implementation

procedure tck(var m,m1:mass;i,j:integer);
begin
if (m[1,i]=m1[1,j]) and (m[2,i]=m1[2,j]) then
 begin
 if m[3,i]=0 then m[1,i]:=m[1,i]-1;
 if m[3,i]=1 then m[2,i]:=m[2,i]-1;
 if m[3,i]=2 then m[1,i]:=m[1,i]+1;
 if m[3,i]=3 then m[2,i]:=m[2,i]+1;
 end;
end;

procedure opengraph;
var
gd,gm,graphresult,color:integer;
begin
 Gd:=Detect;
InitGraph(Gd, Gm, 'c:\Tp\bgi');
{If GraphResult <> grOk Then begin Halt(1);
end;}
{Color:=GetMaxColor;}
end;

procedure perevod (var st:string);
var
i:integer;
begin
for i:=1 to length(st) do
 begin
 if (st[i]>='а') AND (ST[I]<='п') THEN
  st[i]:=chr(ord(st[i])-32);
 if (st[i]>='р') AND (ST[I]<='я') THEN
  st[i]:=chr(ord(st[i])-16);
 if (st[i]>='А') AND (ST[I]<='Я') THEN
  st[i]:=chr(ord(st[i])+64);
  END;
  end;

procedure vvod (st:string; var a:real);
begin
writeln(st);
readln(a);
end;

procedure vvodg (var p:real; x,y:integer);
var
s:string;
ch:char;
z,t:integer;
begin
setcolor (14);
outtextxy(x,y,'Введите три цифры');
ch:=readkey;
outtextxy(x,y+10,ch);
val(ch,t,z);
p:=t*100;
ch:=readkey;
outtextxy(x+10,y+10,ch);
val(ch,t,z);
p:=p+t*10;
ch:=readkey;
outtextxy(x+10,y+10,ch);
val(ch,t,z);
p:=p+t;
delay(200);
end;

procedure vivodg(n:real;st:string;  x,y:integer);
var
s:string;
begin
str(n,s);
s:=st+s;
outtextxy(x,y,s);
end;

procedure zapf (st:string;n:real; var f:text);
var
s:string;
begin
str(n,s);
s:=st+s;
perevod(s);
writeln(f,s);
end;

end.
