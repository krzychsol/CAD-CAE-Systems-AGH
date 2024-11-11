% Initial parameters %
size = 4;
max_size = 1024;
max_iterations = 11;
sensivity = 1;

% Initial bitmap %
%bitmap = imresize(initial_image, [initial_size initial_size]); %
times_file = fopen('times.txt', 'a');

iteration = 1;
while iteration < max_iterations
    fprintf('Iteracja %d, rozmiar bitmapy: %dx%d\n', iteration, size, size);
    tic;
    bitmap_h_blue('galaxy_simple.jpg', size, size, 1, iteration, false);
    elapsed_time = toc;
    %output_filename = sprintf('galaxy_mesh_%d_%d.jpg', iteration, size);
    %saveas(gcf, output_filename);

    fprintf('Czas adaptacji: %.4f sekund\n\n', elapsed_time);
    %fprintf(times_file, 'Iteracja %d, rozmiar bitmapy: %dx%d, Czas adaptacji: %.4f sekund\n', iteration, size, size, elapsed_time);
    
    iteration = iteration + 1;
    disp('Naciśnij dowolny klawisz, aby kontynuować...');
    pause;
end
