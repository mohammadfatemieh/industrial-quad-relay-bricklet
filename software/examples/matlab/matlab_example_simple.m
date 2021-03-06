function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletIndustrialQuadRelay;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Industrial Quad Relay Bricklet

    ipcon = IPConnection(); % Create IP connection
    iqr = handle(BrickletIndustrialQuadRelay(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn relays alternating on/off 10 times with 100 ms delay
    for i = 0:9
        pause(0.1);
        iqr.setValue(bitshift(1, 0));
        pause(0.1);
        iqr.setValue(bitshift(1, 1));
        pause(0.1);
        iqr.setValue(bitshift(1, 2));
        pause(0.1);
        iqr.setValue(bitshift(1, 3));
    end

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
