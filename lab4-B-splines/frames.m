filename = 'zeland.png';  % Plik z mapą wysokości
elements = 100;          % Liczba elementów w siatce
p = 2;                   % Stopień funkcji B-spline

% Generowanie danych wysokości terenu
GRAY = bitmap_terrain(filename, elements, p);

% Ustawienia kamery i kąta obrotu
angles = 0:5:355;       % Kąty obrotu od 0 do 350 stopni, co 10 stopni
output_folder = 'images/'; % Folder do zapisu wygenerowanych obrazów

% Tworzenie widoków w różnych perspektywach
for i = 1:length(angles)
    % Tworzenie rysunku 3D w MATLAB
    figure('Visible', 'on', 'Position', [100, 100, 1920, 1080]); % Ukrycie okna graficznego
    surf(GRAY * 0.5); % Wygenerowanie powierzchni
    colormap("jet");
    shading interp;
    lighting gouraud;
    camlight headlight;
    material shiny;
    view(angles(i), 20); % Ustawienie kąta kamery
    axis equal;
    axis off;
    alpha(0.9);
    
    % Zapisanie obrazu jako bitmapa
    filename = fullfile(output_folder, sprintf('view_%03d.png', angles(i)));
    saveas(gcf, filename);
    close;
end
