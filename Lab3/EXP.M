function [mv, sigma2, Me] = nume_grupa(n)

% Verificare validitate input
if n<20
    error('Parametrul de intrare trebuie să fie un număr întreg >= 20');
end

% Obținem ziua curentă pentru interval
d = day(datetime('now'));

% Limitele intervalului [d, 3d]
lower_limit = d;
upper_limit = 3 * d;

% Parametrii distribuției normale
mu = (lower_limit + upper_limit) / 2; % media
sigma = (upper_limit - lower_limit) / 6; % abaterea standard (aproximează 99.7% în interval)

% Generăm numere din distribuția normală trunchiată pe [lower_limit, upper_limit]
V = zeros(1, n);
for i = 1:n
    while true
        value = mu + sigma * randn; % Generare normală
        if value >= lower_limit && value <= upper_limit
            V(i) = value;
            break;
        end
    end
end

% Calculăm media aritmetică
mv = mean(V);

% Calculăm estimația erorii standard (dispersia)
sigma2 = var(V);

% Calculăm mediana de selecție
Me = median(V);

% Afișăm histograma
figure;
histogram(V, 'FaceColor', 'green', 'Normalization', 'pdf');
title('Histograma Distribuției Datelor Experimentale');
xlabel('Valori');
ylabel('Densitate de probabilitate');
grid on;
legend('Date experimentale');

% Calculăm intervalul de încredere pentru 99.73%
confidence_interval = [mv - 3*sqrt(sigma2)/sqrt(n), mv + 3*sqrt(sigma2)/sqrt(n)];

% Afișăm rezultatele în linia de comandă
fprintf('Rezultate statistice:\n');
fprintf('Media aritmetică: %.4f\n', mv);
fprintf('Estimația erorii standard (varianța): %.4f\n', sigma2);
fprintf('Mediana de selecție: %.4f\n', Me);
fprintf('Interval de încredere (η = 0.9973): [%.4f, %.4f]\n', ...
    confidence_interval(1), confidence_interval(2));

end




  % Calcularea intervalului de încredere

% conf_level = 0.9973; % Nivelul de încredere
%  z_score = norminv((1 + conf_level) / 2); % Punctul critic z
%  margin_error = z_score * (std_dev / sqrt(n));
%  conf_interval = [mv - margin_error, mv + margin_error];
