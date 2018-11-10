program Lab_3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  Abon =^pers;
  pers=record
    fio: string[20];
    number: string[7];
    next: Abon;
  end;

var
  p,Listhead:abon;
  direct: boolean;
  num:char;

procedure sernamesort(ListHead:Abon);
var
  str: string[20];
  fl,exist:boolean;
  el:Abon;
begin
  write('Enter surname you needed: ');
  readln(str);
  fl:=true;
  el:=listhead;
  exist:=false;
  while fl do
  begin
    if pos(str,el^.fio)>0 then
    begin
      writeln(el^.fio,' - ',el^.number);
      exist:=true;
    end;

    if el^.next<>nil then
      el:=el^.next
    else
      fl:=false
  end;
  if exist=false then
    writeln('There is no person with such number');
end;

procedure numbersort(ListHead:Abon);
var
  str: string[7];
  fl, exist:boolean;
  el:Abon;
begin
  write('Enter number you needed: ');
  readln(str);
  fl:=true;
  el:=listhead;
  exist:=false;
  while fl do
  begin
    if pos(str,el^.number)>0 then
    begin
      writeln(el^.fio,' - ',el^.number);
      exist:=true;
    end;

    if el^.next<>nil then
      el:=el^.next
    else
      fl:=false
  end;
  if exist=false then
    writeln('There is no person with such number');
end;

procedure Sorting(ListHead:Abon);
var
  pers,help:Abon;
  min:string[20];
  num:string[7];
  fl1,fl2:boolean;

begin
  writeln;
  writeln('Sorting by surname:');
  Pers:=ListHead;
  fl1:=true;
  while fl1 do
  begin
    Help:= pers^.next;
    fl2:=true;
    while fl2 do
    begin
      if Help^.fio < Pers^.fio then
      begin
        min:=help^.fio;
        num:=help^.number;
        help^.fio:= pers^.fio;
        help^.number:=pers^.number;
        pers^.fio:= min;
        pers^.number:=num;
      end;
      if help^.next<>nil then
        help:= help^.next
      else
        fl2:=false
    end;
    if pers^.next^.next<>nil then
      pers:= pers^.next
    else
      fl1:=false  
  end;

  pers := Listhead;
  fl1:=true;
  while fl1 do
  begin
     writeln(pers^.fio,' - ',pers^.number);
     if pers^.next<>nil then      
       pers := pers^.next
     else
       fl1:=false
  end;


  writeln;
  writeln('Sorting by numbers:');
  Pers:=ListHead;
  fl1:=true;
  while fl1 do
  begin
    Help:= pers^.next;
    fl2:=true;
    while fl2 do
    begin
      if Help^.number < Pers^.number then
      begin
        min:=help^.fio;
        num:=help^.number;
        help^.fio:= pers^.fio;
        help^.number:=pers^.number;
        pers^.fio:= min;
        pers^.number:=num;
      end;
      if help^.next<>nil then
        help:= help^.next
      else
        fl2:=false
    end;
    if pers^.next^.next<>nil then
      pers:= pers^.next
    else
      fl1:=false  
  end;

  pers := Listhead;
  fl1:=true;
  while fl1 do
  begin
     writeln(pers^.fio,' - ',pers^.number);
     if pers^.next<>nil then      
       pers := pers^.next
     else
       fl1:=false
  end;

end;


begin
  direct:=true;
  ListHead:=nil;
  p:=nil;
  while direct do
  begin
    if ListHead=nil then
    begin
      new(p);
      p^.next:=nil;
      ListHead:=p;
    end
    else
    begin
      new(p^.next);
      p:=p^.next;
      p^.next:=nil;
    end;
    writeln;
    write('Enter tne surname: ');
    readln(p^.fio);
    write ('Enter tne number: ');
    readln(p^.number);
    write('Do you want to continue?(Yes - 1; No - 2): ');
    readln(num);
    writeln;
    if num='2' then
      direct:=false
end;



  direct:=true;
  while direct do
  begin
    writeln;
    sorting(ListHead);
    writeln;
    write('Do you want to sort by surname(1) or by number(2)? ');
    readln(num);
    if num='1' then
      Sernamesort(ListHead)
    else
      Numbersort(listHead);
    write('Do you want to continue?(Yes - 1; No - 2): ');
    readln(num);
    if num='2' then
      direct:=false
  end;
  
   while ListHead <> nil do
   begin
     p := ListHead^.Next;
     Dispose(ListHead);
     ListHead := p
   end;

end.
