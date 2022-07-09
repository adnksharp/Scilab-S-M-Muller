k = 1;
for c = 1:4
    out = "Factor " + string(c) + ", para x^" + string(4-c) + ": ";
    f(1,c) = strtod(input(out, "s"));
end
for c = 1:3
    out = "Valor inicial x" + string(c) + ": "; 
    f(2,c) = strtod(input(out, "s"));    
end

while 1
    for i = 1:3
        fx(i) = 0;
        for c = 1:4
            fx(i) = fx(i) + (f(1,c) * f(2,i)^(4-c));
        end
    end

    h(1) = f(2,2) - f(2,1);
    h(2) = f(2,3) - f(2,2);

    Delta(1) = (fx (2) - fx(1)) / (f(2,2) - f(2,1));
    Delta(2) = (fx (3) - fx(2)) / (f(2,3) - f(2,2));

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

    f(2,4) = f(2,3) + (-2 * c) / (dcnt);

    for i = 1:3
        f(2,i) = f(2,i + 1);
    end
    if abs((f(2,3)-f(2,2))/f(2,3)) < (1*10^-6)
        break;
    end
    k = k + 1;
end

out = "";
for c = 1:4
    if f(1,c) > 0
        if c > 1
            out = out + " + ";
        end
        out = out + string(f(1,c)) + "x^" + string(4-c);
    elseif f(1,c) < 0
        out = out + " - " + string(abs(f(1,c))) + "x^" + string(4-c);
    end
end

mprintf("\n%s\n\nIteraciones:\t%d\nx_r:\t\t%s", out, k, string(f(2,4)));