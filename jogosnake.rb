require 'rubygems'
require 'gosu'


class SnakeGame < Gosu::Window
    WIDTH, HEIGHT = 400, 400
    TILE = 10

    WIDTH_IN_TILE = WIDTH/TILE
    def initialize
        super WIDTH, HEIGHT, false, 1000/15

        @fruit = Fruit.new
        @snake = Snake.new
    end

    def update
        if @snake.x == @fruit.x && @snake.y == @fruit.y
            @snake.increase
            @fruit.regenerate
        end

        @fruit.update
        @snake.update
    end

    def draw
        @fruit.draw
        @snake.draw
    end

    def button_down(id)
        case id
        when Gosu::KbUp then @snake.up
        when Gosu::KbDown then @snake.down
        when Gosu::KbLeft then @snake.left
        when Gosu::KbRight then @snake.right
        end
    end
end

class Snake
    attr_accessor :x, :y
    def initialize
        @x = 10
        @y = 10

        @velx = 0
        @vely = 0
    end

    def update
        @x += @velx
        @y += @vely

        @x = 0 if @x > SnakeGame::WIDTH_IN_TILE
        @x = SnakeGame::WIDTH_IN_TILE if @x < 0
        @y = 0 if @y > SnakeGame::WIDTH_IN_TILE
        @y = SnakeGame::WIDTH_IN_TILE if @y < 0
    end

    def draw
        Gosu.draw_rect(
            @x * SnakeGame::TILE,
            @y * SnakeGame::TILE,
            SnakeGame::TILE,
            SnakeGame::TILE,
            Gosu::Color::GREEN
        )
    end
    def increase
    end

    def up;    @velx = 0; @vely = -1; end
    def down;  @velx = 0; @vely = 1; end
    def left;  @velx = -1; @vely = 0; end
    def right; @velx = 1; @vely = 0; end
end

class Fruit
    attr_accessor :x, :y
    def initialize
        @x = 15
        @y = 15
    end

    def update
    end

    def draw
        Gosu.draw_rect(
            @x * SnakeGame::TILE,
            @y * SnakeGame::TILE,
            SnakeGame::TILE,
            SnakeGame::TILE,
            Gosu::Color::RED
        )
    end
    def regenerate
        @x = (rand * SnakeGame::TILE).floor
        @y = (rand * SnakeGame::TILE).floor
    end
end
SnakeGame.new.show