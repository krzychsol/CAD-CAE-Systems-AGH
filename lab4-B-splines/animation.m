% Ustawienia
output_folder = 'images/'; % Folder z wygenerowanymi obrazami
output_video = 'terrain_animation.mp4'; % Nazwa pliku wideo
frame_rate = 10; % Liczba klatek na sekundę

% Tworzenie obiektu wideo
video = VideoWriter(output_video, 'Motion JPEG AVI'); % Użycie formatu MP4
video.FrameRate = frame_rate; % Ustawienie liczby klatek na sekundę
open(video); % Otwarcie pliku wideo do zapisu

% Wczytywanie i dodawanie obrazów do wideo
angles = 0:5:355; % Zakres kątów, odpowiadający wygenerowanym obrazom
for i = 1:length(angles)
    % Odczytanie każdej klatki obrazu
    filename = fullfile(output_folder, sprintf('view_%03d.png', angles(i)));
    img = imread(filename);
    
    % Zapisanie klatki do obiektu wideo
    writeVideo(video, img);
end

% Zakończenie i zapisanie pliku wideo
close(video);

disp('Animacja została zapisana jako terrain_animation.mp4');
