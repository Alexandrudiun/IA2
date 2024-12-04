function [mv, sigma2, Me] = ab311(n)
    d=day(datetime('now'));
    
    v = d + (2*d)*randn(1,n); 

    mv = mean(v);
    sigma2 = var(v);
    Me = median(v);
        
    figure;
    histogram(v, 'FaceColor', 'green');
    grid on;
    title('Histogramă a setului de date generat');
    xlabel('Valori');
    ylabel('Frecvență');
    legend('Set de date');


confidence_interval = [mv - 3*sqrt(sigma2)/sqrt(n), mv + 3*sqrt(sigma2)/sqrt(n)];

disp('Rezultate statistice:');
disp('Media aritmetică:');
disp(mv);
disp('Estimația erorii standard (varianța):');
disp(sigma2);
disp('Mediana de selecție:');
disp(Me);
disp('Interval de încredere (η = 0.9973):');
disp(confidence_interval);

end

