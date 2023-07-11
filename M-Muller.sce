a = [ ], f = [ ];
tol = 0.05 / 100;
c = 1.0;
mprintf("\tMetodo de müller\nf(x) = ");
init = input("", "s");
mprintf("Valores iniciales: ");
x0 = input("", "s");

x = strsubst(init, " ", "");
in_k = strstr(x, "x^3");
if in_k ~= "" then
	k = strsplit(x, "x^3");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(1) = "1";
		else
			a(1) = k(1);
		end
		x = k(2);
	end
else
	a(1) = "0";
end

in_k = strstr(x, "x^2");
if in_k ~= "" then
	k = strsplit(x, "x^2");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(2) = "1";
		else
			a(2) = k(1);
		end
		x = k(2);
	end
else
	a(2) = "0";
end

in_k = strstr(x, "x");
if in_k ~= "" then
	k = strsplit(x, "x");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(3) = "1";
		else
			a(3) = k(1);
		end
		x = k(2);
	end
else
	a(3) = "0";
end

if length(x) > 0 then
	a(4) = x;
else
	a(4) = "0";
end

for i = 1:4
	a(i) = strsubst(a(i), "(", "");
	a(i) = strsubst(a(i), ")", "");
	a(i) = strsubst(a(i), "%pi", "3.141592653589");
	a(i) = strsubst(a(i), "%e", "2.718281828459");
	k = strsplit(a(i), "/");
	if size(k, "*") > 1 then
		f(i) = strtod(k(1)) / strtod(k(2));
	else
		k = strsplit(a(i), "*");
		if size(k, "*") > 1 then
			f(i) = strtod(k(1)) * strtod(k(2));
		else
			f(i) = strtod(a(i));
		end
	end
end

x0 = strsubst(x0, " ", "");
x0 = strsubst(x0, "y", ",");

k = strsplit(x0, ",");
if size(k, "*") < 3 then
	mprintf("Error: Deben ser 3 valores iniciales\n");
	return;
end

for i = 1:size(k, "*")
	g(i) = strtod(k(i));
end

mprintf("...\n\n");

k = 1;
while 1
    for i = 1:3
        fx(i) = 0;
        for c = 1:4
            fx(i) = fx(i) + (f(c) * g(i)^(4-c));
        end
    end

    h(1) = g(2) - g(1);
    h(2) = g(3) - g(2);

    Delta(1) = (fx (2) - fx(1)) / (g(2) - g(1));
    Delta(2) = (fx (3) - fx(2)) / (g(3) - g(2));

    a = (Delta(2) - Delta(1)) / (h(2)+h(1));
    b = a * h(2) + Delta(2);
    c = fx(3);

    dcnt = (b^2) - (4*a*c);
    dcnt = sqroot(dcnt);

    if b - dcnt > b + dcnt
        dcnt = b - dcnt;
    else
        dcnt = b + dcnt;
    end

    g(4) = g(3) + (-2 * c) / (dcnt);

    for i = 1:3
        g(i) = g(i + 1);
    end
    if abs((g(3)-g(2))/g(3)) < tol
        break;
    end
    k = k + 1;
end

mprintf("f(x) = (%s)x^3 + (%s)x^2 + (%s)x + (%s)\n", string(f(1)), string(f(2)), string(f(3)), string(f(4)));
mprintf("x0 = (%s, %s, %s)\n", string(g(4)), string(g(3)), string(g(2)));
