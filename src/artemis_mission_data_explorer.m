function artemis_mission_data_explorer()
%% ARTEMIS_MISSION_DATA_EXPLORER
% A simple MATLAB menu-based tool that makes Artemis mission information
% easier for the general public to explore and understand.
% Made by: Yassin Elhadidi and Laney Fagerstrom
% Github: https://github.com/Yasssiiin/matlab-artemis-explorer
% Course: CSCI-1060, Saint Louis University
%
% This script opens a menu that lets the user:
%   - Read Artemis I, II, and III mission overviews
%   - Learn why lunar missions matter
%   - Read a simplified explanation of the Artemis program
%   - View an Artemis I-VII roadmap plot
%   - View simplified trajectory plots for Artemis I, II, and III
%   - Open NASA Artemis news and the NASA image gallery

    clc;
    close all;

    % Build the Artemis mission data once so the menu can reuse it.
    missionData = buildMissionData();

    % Keep showing the menu until the user chooses Exit.
    keepRunning = true;
    while keepRunning
        choice = menu( ...
            'Artemis Mission Data Explorer', ...
            'Artemis I Overview', ...
            'Artemis II Overview', ...
            'Artemis III Overview', ...
            'Why Lunar Missions Matter', ...
            'Entire Artemis Program Explained', ...
            'Mission Timeline Visualization', ...
            'Artemis I Trajectory Visualization', ...
            'Artemis II Trajectory Visualization', ...
            'Artemis III Trajectory Visualization', ...
            'Open Artemis News', ...
            'Open NASA Gallery', ...
            'Exit');

        switch choice
            case 1
                showMissionSummary(missionData(1));
            case 2
                showMissionSummary(missionData(2));
            case 3
                showMissionSummary(missionData(3));
            case 4
                showWhyLunarMissions();
            case 5
                showEntireArtemisExplanation(missionData);
            case 6
                showTimelineVisualization(missionData);
            case 7
                showTrajectoryVisualization(missionData(1));
            case 8
                showTrajectoryVisualization(missionData(2));
            case 9
                showTrajectoryVisualization(missionData(3));
            case 10
                openWebsite('https://www.nasa.gov/humans-in-space/artemis/');
            case 11
                openWebsite('https://images.nasa.gov/');
            otherwise
                keepRunning = false;
                msgbox( ...
                    sprintf(['Thank you for using Artemis Mission Data Explorer.\n\n' ...
                    'Created by Yassin Elhadidi and Delaney Fagerstrom.']), ...
                    'Goodbye');
        end
    end
end

function missionData = buildMissionData()
% BUILDMISSIONDATA stores mission facts in a structure array so they can
% be reused in summary windows and plots.

    missionData(1).name = 'Artemis I';
    missionData(1).missionType = 'Uncrewed lunar test flight';
    missionData(1).agency = 'NASA';
    missionData(1).spacecraft = 'Orion';
    missionData(1).rocket = 'Space Launch System (SLS)';
    missionData(1).crewSize = 0;
    missionData(1).launchYear = 2022;
    missionData(1).status = 'Completed';
    missionData(1).primaryGoal = 'Test Orion and SLS together in deep space before sending astronauts.';
    missionData(1).trajectory = 'Earth launch -> Moon orbit path -> deep-space travel -> return to Earth';
    missionData(1).summary = [ ...
        'Artemis I was the first mission in NASA''s Artemis program and it flew without a crew. ' ...
        'Its main purpose was to test the Orion spacecraft and the Space Launch System rocket in a real deep-space mission. ' ...
        'The spacecraft traveled around the Moon and then returned safely to Earth. ' ...
        'This mission helped NASA confirm that the systems needed for future astronaut missions can work in space.'];
    missionData(1).importance = [ ...
        'Artemis I was important because it was the first major test of the Artemis system. ' ...
        'It reduced risk for future crewed flights and provided data about spacecraft performance, heat shielding, communication, and navigation.'];
    missionData(1).nasaUrl = 'https://www.nasa.gov/mission/artemis-i';

    missionData(2).name = 'Artemis II';
    missionData(2).missionType = 'Crewed lunar flyby (no landing)';
    missionData(2).agency = 'NASA';
    missionData(2).spacecraft = 'Orion';
    missionData(2).rocket = 'Space Launch System (SLS)';
    missionData(2).crewSize = 4;
    missionData(2).launchYear = 2026;
    missionData(2).status = 'Completed';
    missionData(2).primaryGoal = 'Test human deep-space travel systems with astronauts on board.';
    missionData(2).trajectory = 'Earth orbit -> Moon flyby -> return to Earth';
    missionData(2).summary = [ ...
        'Artemis II is NASA''s first crewed mission in the Artemis program and a major step toward returning humans to the Moon. ' ...
        'Four astronauts will travel aboard the Orion spacecraft, launched by the Space Launch System rocket, and perform a flyby of the Moon before returning to Earth. ' ...
        'The mission does not include a lunar landing. ' ...
        'Instead, it is designed to test life support, navigation, and deep-space operations with a human crew on board.'];
    missionData(2).importance = [ ...
        'Artemis II is historically significant because it became the first crewed mission beyond low Earth orbit since the Apollo era. ' ...
        'It helps prove that NASA can safely send astronauts far from Earth again, which is necessary before future Moon operations and long-term missions to Mars.'];
    missionData(2).nasaUrl = 'https://www.nasa.gov/mission/artemis-ii';

    missionData(3).name = 'Artemis III';
    missionData(3).missionType = 'Rendezvous and docking in low Earth orbit';
    missionData(3).agency = 'NASA';
    missionData(3).spacecraft = 'Orion and commercial landing systems';
    missionData(3).rocket = 'Space Launch System (SLS)';
    missionData(3).crewSize = 4;
    missionData(3).launchYear = 2027;
    missionData(3).status = 'Planned';
    missionData(3).primaryGoal = 'Test rendezvous and docking operations needed for future lunar landing missions.';
    missionData(3).trajectory = 'Earth launch -> low Earth orbit operations -> docking tests -> return';
    missionData(3).summary = [ ...
        'Artemis III is currently described by NASA as a mission in low Earth orbit. ' ...
        'It is designed to test rendezvous and docking operations between Orion and commercial systems that will be needed before later lunar landing missions. ' ...
        'This mission builds on Artemis I and Artemis II by moving toward a more complete Moon mission architecture.'];
    missionData(3).importance =  ...
        'Artemis III matters because successful docking and integrated operations are essential before astronauts can safely transfer between spacecraft for future Moon landings.';
    missionData(3).nasaUrl = 'https://www.nasa.gov/mission/artemis-iii';

    % The missions below extend the visualization so the roadmap looks
    % fuller and better communicates the long-term Artemis campaign.
    missionData(4).name = 'Artemis IV';
    missionData(4).missionType = 'Projected crewed lunar surface mission';
    missionData(4).agency = 'NASA';
    missionData(4).spacecraft = 'Orion and lunar landing systems';
    missionData(4).rocket = 'Space Launch System (SLS)';
    missionData(4).crewSize = 4;
    missionData(4).launchYear = 2028;
    missionData(4).status = 'Roadmap';
    missionData(4).primaryGoal = 'Continue crewed lunar exploration and expand south pole operations.';
    missionData(4).trajectory = 'Earth launch -> lunar orbit -> surface mission -> return';
    missionData(4).summary = 'Artemis IV is shown here as a roadmap mission that represents the next stage of sustained human lunar exploration.';
    missionData(4).importance = 'This entry helps users see how Artemis can grow from test flights into repeated lunar missions.';
    missionData(4).nasaUrl = 'https://www.nasa.gov/mission/artemis-iv';

    missionData(5).name = 'Artemis V';
    missionData(5).missionType = 'Projected lunar surface mission';
    missionData(5).agency = 'NASA';
    missionData(5).spacecraft = 'Orion, landers, and support systems';
    missionData(5).rocket = 'Space Launch System (SLS)';
    missionData(5).crewSize = 4;
    missionData(5).launchYear = 2029;
    missionData(5).status = 'Roadmap';
    missionData(5).primaryGoal = 'Continue surface missions and strengthen long-term lunar operations.';
    missionData(5).trajectory = 'Earth launch -> lunar orbit -> surface mission -> return';
    missionData(5).summary = 'Artemis V is included to show the growing cadence of Moon missions in NASA''s broader exploration roadmap.';
    missionData(5).importance = 'This step helps explain the move from single missions to a campaign with repeated Moon access.';
    missionData(5).nasaUrl = 'https://www.nasa.gov/event/artemis-v/';

    missionData(6).name = 'Artemis VI';
    missionData(6).missionType = 'Projected sustained lunar campaign mission';
    missionData(6).agency = 'NASA';
    missionData(6).spacecraft = 'Crew and cargo lunar systems';
    missionData(6).rocket = 'NASA and partner launch systems';
    missionData(6).crewSize = 4;
    missionData(6).launchYear = 2030;
    missionData(6).status = 'Projected';
    missionData(6).primaryGoal = 'Expand surface science, logistics, and recurring lunar stays.';
    missionData(6).trajectory = 'Earth launch -> lunar orbit -> extended lunar operations -> return';
    missionData(6).summary = 'Artemis VI is a projected campaign mission used here to extend the roadmap beyond the currently named early missions.';
    missionData(6).importance = 'It helps visualize a future where NASA returns to the Moon regularly instead of occasionally.';
    missionData(6).nasaUrl = 'https://www.nasa.gov/humans-in-space/artemis/';

    missionData(7).name = 'Artemis VII';
    missionData(7).missionType = 'Projected moon-base support mission';
    missionData(7).agency = 'NASA';
    missionData(7).spacecraft = 'Crew, cargo, and base support systems';
    missionData(7).rocket = 'NASA and partner launch systems';
    missionData(7).crewSize = 4;
    missionData(7).launchYear = 2031;
    missionData(7).status = 'Projected';
    missionData(7).primaryGoal = 'Support the idea of a growing lunar outpost with repeat crew and cargo missions.';
    missionData(7).trajectory = 'Earth launch -> lunar orbit -> moon-base support mission -> return';
    missionData(7).summary = 'Artemis VII is a public-understanding roadmap mission that represents support for a more mature Moon base concept.';
    missionData(7).importance = 'It gives the visualization a clearer long-term destination and shows why the earlier missions matter.';
    missionData(7).nasaUrl = 'https://www.nasa.gov/humans-in-space/artemis/';
end

function showMissionSummary(mission)
% SHOWMISSIONSUMMARY opens a simple text dialog for the selected mission.

    details = sprintf([ ...
        '%s\n\n' ...
        'Mission Type: %s\n' ...
        'Agency: %s\n' ...
        'Spacecraft: %s\n' ...
        'Rocket: %s\n' ...
        'Crew Size: %d\n' ...
        'Planned/Launch Year: %d\n' ...
        'Status: %s\n' ...
        'Primary Goal: %s\n' ...
        'Trajectory: %s\n\n' ...
        'Simple Summary:\n%s\n\n' ...
        'Why It Matters:\n%s'], ...
        mission.name, ...
        mission.missionType, ...
        mission.agency, ...
        mission.spacecraft, ...
        mission.rocket, ...
        mission.crewSize, ...
        mission.launchYear, ...
        mission.status, ...
        mission.primaryGoal, ...
        mission.trajectory, ...
        mission.summary, ...
        mission.importance);

    helpdlg(details, mission.name);
end

function showWhyLunarMissions()
% SHOWWHYLUNARMISSIONS explains the value of lunar exploration in simple terms.

    message = sprintf([ ...
        'Why are lunar missions important?\n\n' ...
        '1. The Moon is a nearby testing ground for deep-space exploration.\n' ...
        '2. Lunar missions help engineers improve spacecraft, life support, and navigation systems.\n' ...
        '3. Scientists can study the Moon to learn more about the history of the solar system.\n' ...
        '4. NASA can practice long-term missions that may later support travel to Mars.\n' ...
        '5. These missions inspire public interest in science, technology, engineering, and math.\n\n' ...
        'In simple terms, going to the Moon helps humanity learn how to live, work, and explore farther from Earth.']);

    helpdlg(message, 'Why Lunar Missions Matter');
end

function showEntireArtemisExplanation(missionData)
% SHOWENTIREARTEMISEXPLANATION summarizes the overall Artemis program.

    message = sprintf([ ...
        'The Artemis program is NASA''s modern plan to return humans to the Moon and prepare for future missions to Mars.\n\n' ...
        'Program Steps:\n' ...
        '1. Artemis I tested the Orion spacecraft and SLS rocket without astronauts.\n' ...
        '2. Artemis II will send astronauts around the Moon to test human deep-space travel.\n' ...
        '3. Artemis III tests docking and integrated mission operations needed before later landing missions.\n\n' ...
        'Main Goals:\n' ...
        '- Return humans to the Moon safely.\n' ...
        '- Build experience for sustainable lunar exploration.\n' ...
        '- Support scientific discoveries.\n' ...
        '- Inspire the public and future scientists.\n' ...
        '- Prepare for eventual human missions to Mars.\n\n' ...
        'Current Artemis Missions Included in This Tool:\n' ...
        '- %s\n' ...
        '- %s\n' ...
        '- %s'], ...
        missionData(1).name, missionData(2).name, missionData(3).name);

    helpdlg(message, 'Entire Artemis Program');
end

function showTimelineVisualization(missionData)
% SHOWTIMELINEVISUALIZATION creates a black-background Artemis I-VII
% roadmap plot so the full campaign looks richer and easier to present.

    years = [missionData.launchYear];
    crewSizes = [missionData.crewSize];
    labels = {missionData.name};
    colors = [ ...
        0.10 0.80 0.55
        0.10 0.65 0.95
        0.90 0.75 0.20
        0.95 0.55 0.25
        0.95 0.35 0.35
        0.75 0.45 0.95
        0.70 0.72 0.90];

    figure('Name', 'Artemis I-VII Mission Visualization', 'NumberTitle', 'off', 'Color', 'k');

    subplot(2,1,1);
    hold on;
    set(gca, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'GridColor', [0.5 0.5 0.5]);
    plot(years, 1:numel(years), '-', 'Color', [0.60 0.60 0.75], 'LineWidth', 1.5);
    for index = 1:numel(years)
        scatter(years(index), index, 170, colors(index, :), 'filled');
        text(years(index) + 0.08, index, [labels{index} ' - ' missionData(index).status], ...
            'Color', 'w', 'FontSize', 9, 'VerticalAlignment', 'middle');
    end
    xlabel('Year', 'Color', 'w');
    ylabel('Mission Order', 'Color', 'w');
    title('Artemis I-VII Roadmap', 'Color', 'w');
    yticks(1:numel(labels));
    yticklabels(labels);
    xlim([2021.5 2031.8]);
    ylim([0.5 numel(labels) + 0.5]);
    grid on;

    subplot(2,1,2);
    hold on;
    set(gca, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'GridColor', [0.5 0.5 0.5]);
    bar(1:numel(labels), crewSizes, 0.55, 'FaceColor', [0.15 0.50 0.95], 'EdgeColor', [0.90 0.90 1.00]);
    plot([5 6 7], [4.3 4.7 5.1], 'o-', 'Color', [0.95 0.85 0.35], 'LineWidth', 2, ...
        'MarkerFaceColor', [0.95 0.85 0.35]);
    text(5.15, 5.25, 'Moon base growth concept', 'Color', [0.95 0.90 0.55], 'FontSize', 10);
    xticks(1:numel(labels));
    xticklabels(labels);
    xlim([0.4 8.2]);
    ylim([0 6]);
    ylabel('Crew / Campaign Scale', 'Color', 'w');
    title('Crewed Campaign Growth', 'Color', 'w');
    grid on;
end

function showTrajectoryVisualization(mission)
% SHOWTRAJECTORYVISUALIZATION draws a simplified mission path with Earth
% and the Moon so the user can quickly understand how the mission traveled.

    try
        figure('Name', [mission.name ' Trajectory'], 'NumberTitle', 'off', 'Color', 'k');
        axesHandle = axes;
        hold(axesHandle, 'on');
        axis(axesHandle, 'equal');
        axis(axesHandle, [-2 8 -3 3]);
        set(axesHandle, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'GridColor', [0.5 0.5 0.5]);
        xlabel('Simplified Distance', 'Color', 'w');
        ylabel('Relative Position', 'Color', 'w');
        title([mission.name ' Spacecraft Trajectory'], 'Color', 'w');
        grid(axesHandle, 'on');

        % Add small star points so the plot feels more like a space scene.
        drawStars(45);

        % Draw Earth and Moon as simple circles to make the plot easier to read.
        drawPlanet([0 0], 0.5, [0.2 0.5 1.0], 'Earth');
        drawPlanet([5.5 0], 0.22, [0.8 0.8 0.85], 'Moon');

        switch mission.name
            case 'Artemis I'
                plotArtemisOneTrajectory();
            case 'Artemis II'
                plotArtemisTwoTrajectory();
            case 'Artemis III'
                plotArtemisThreeTrajectory();
            otherwise
                error('ArtemisExplorer:UnsupportedMission', ...
                    'No trajectory plot has been defined for this mission.');
        end

        legendHandle = legend('Trajectory', 'Location', 'southoutside');
        try
            set(legendHandle, 'TextColor', 'w', 'Color', 'k');
        catch
            set(legendHandle, 'Color', 'k');
        end
    catch
        choice = questdlg( ...
            sprintf(['The simplified plot could not be displayed for %s.\n\n' ...
            'Would you like to open the official NASA mission page instead?'], mission.name), ...
            'Trajectory Fallback', ...
            'Open NASA Page', 'Cancel', 'Open NASA Page');

        if strcmp(choice, 'Open NASA Page')
            openWebsite(mission.nasaUrl);
        end
    end
end

function drawPlanet(centerPoint, radius, faceColor, labelText)
% DRAWPLANET draws a simple filled circle for Earth or the Moon.

    angle = linspace(0, 2 * pi, 250);
    xValues = centerPoint(1) + radius * cos(angle);
    yValues = centerPoint(2) + radius * sin(angle);
    patch(xValues, yValues, faceColor, 'EdgeColor', 'w', 'LineWidth', 1.2);
    text(centerPoint(1), centerPoint(2) - radius - 0.25, labelText, ...
        'Color', 'w', 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
end

function drawStars(count)
% DRAWSTARS adds a simple star field to the black background.

    rng(7);
    xValues = -1.8 + 9.0 * rand(count, 1);
    yValues = -2.8 + 5.6 * rand(count, 1);
    scatter(xValues, yValues, 6, [1 1 1], 'filled');
end

function plotArtemisOneTrajectory()
% PLOTARTEMISONETRAJECTORY shows a simple Moon loop and return path.

    t1 = linspace(0, 1, 150);
    x1 = 0.5 + 4.6 * t1;
    y1 = 1.0 * sin(pi * t1);
    plot(x1, y1, 'c--', 'LineWidth', 2, 'DisplayName', 'Trajectory');

    angle = linspace(0.4 * pi, 2.1 * pi, 200);
    x2 = 5.5 + 0.75 * cos(angle);
    y2 = 0 + 1.2 * sin(angle);
    plot(x2, y2, 'y-', 'LineWidth', 2, 'HandleVisibility', 'off');

    t2 = linspace(0, 1, 150);
    x3 = 6.2 - 5.2 * t2;
    y3 = -1.0 * sin(pi * t2);
    plot(x3, y3, 'c--', 'LineWidth', 2, 'HandleVisibility', 'off');

    text(0.7, -0.4, 'Launch', 'Color', 'w');
    text(5.9, 1.3, 'Moon loop', 'Color', 'w');
    text(1.1, -0.6, 'Return to Earth', 'Color', 'w');
end

function plotArtemisTwoTrajectory()
% PLOTARTEMISTWOTRAJECTORY shows a lunar flyby and return path.

    t = linspace(0, 1, 240);
    xValues = 0.5 + 5.5 * t;
    yValues = 0.9 * sin(2 * pi * t) .* exp(-1.2 * (t - 0.5).^2);
    plot(xValues, yValues, 'g-', 'LineWidth', 2.5, 'DisplayName', 'Trajectory');

    angle = linspace(0.55 * pi, 1.45 * pi, 120);
    xFlyby = 5.5 + 0.45 * cos(angle);
    yFlyby = 0 + 0.8 * sin(angle);
    plot(xFlyby, yFlyby, 'y-', 'LineWidth', 2, 'HandleVisibility', 'off');

    text(0.7, -0.4, 'Launch', 'Color', 'w');
    text(5.8, 0.95, 'Moon flyby', 'Color', 'w');
    text(1.2, -0.65, 'Splashdown', 'Color', 'w');
end

function plotArtemisThreeTrajectory()
% PLOTARTEMISTHREETRAJECTORY shows a simplified lunar landing style path.

    t1 = linspace(0, 1, 160);
    x1 = 0.5 + 5.0 * t1;
    y1 = 0.8 * sin(pi * t1);
    plot(x1, y1, 'm-', 'LineWidth', 2.5, 'DisplayName', 'Trajectory');

    plot([5.5 5.5], [0 1.1], 'y--', 'LineWidth', 2, 'HandleVisibility', 'off');
    plot([5.5 5.5], [1.1 0], 'y--', 'LineWidth', 2, 'HandleVisibility', 'off');

    t2 = linspace(0, 1, 140);
    x2 = 5.5 - 4.5 * t2;
    y2 = -0.9 * sin(pi * t2);
    plot(x2, y2, 'm-', 'LineWidth', 2.5, 'HandleVisibility', 'off');

    text(0.7, -0.4, 'Launch', 'Color', 'w');
    text(5.65, 1.15, 'Landing phase', 'Color', 'w');
    text(1.2, -0.65, 'Return to Earth', 'Color', 'w');
end

function openWebsite(url)
% OPENWEBSITE opens a NASA resource in the default web browser.

    try
        web(url, '-browser');
    catch
        errordlg(sprintf('Could not open the website automatically.\n\nURL: %s', url), ...
            'Browser Error');
    end
end
