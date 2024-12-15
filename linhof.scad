$fn = 100;

// 補助のリングを出すかどうかの制御
is_ling = true;
//is_ling = false;

union() {
    difference() {
        linear_extrude(height = 2) {
            difference() {
                polygon(
                    points=[
                        [0, 0],
                        [96, 0],
                        [96, 99 - 8],
                        [96-5.5, 99],
                        [96 - 8.5, 99],
                        [96 - 8.5, 99 - 1.5],
                        [96 - 8.5 - 10.5, 99 - 1.5],
                        [77, 99],
                        [49, 99],
                        [49, 99 - 3],
                        [47, 99 - 3],
                        [47, 99],
                        [8.5 + 10.5, 99],
                        [8.5 + 10.5, 99 - 1.5],
                        [8.5, 99 - 1.5],
                        [8.5, 99],
                        [5.5, 99],
                        [0, 99 - 8]
                    ]
                );
                // 穴の直径を実物を元にもう一度調節する
                translate([96 / 2, 57.5]) {
                    circle(35 / 2);
                };
            }
        };
        translate([0, 99, 0.8]){
            rotate(a=[180, 270, 0]) {
                linear_extrude(height = 99) {
                    polygon([
                        [0,0],
                        [2 - 0.8, 2.5],
                        [2, 2.5],
                        [2, 0],
                        [2, -1],
                        [2 - 0.8, -1],
                        [2 - 0.8, 0]
                    ]);
                }
            }
        };
    }
    translate([96 / 2, (96 - 9) / 2 + 7.5]) {
        if (is_ling) {
            linear_extrude(height= 2.5) {
                difference() {
                    circle(r = (96 - 9) / 2, center = true);
                    circle(r = (96 - 13) / 2, center = true);
                }
            }
        }
    };

    translate([96 / 2, (96 - 9) / 2 + 7.5]) {
        if (is_ling) {
            linear_extrude(height= 4) {
                difference() {
                    circle(r = (96 - 13) / 2, center = true);
                    circle(r = (96 - 16) / 2, center = true);
                }
            }
        }
    };
}