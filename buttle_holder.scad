// ペットボトルとかを収めるためのケースを作る
// カップ
// - 底面の直径は8cm
// - 上面での直径は10cm
// - 深さは10cm
// - 厚さが0.5cm
// 持ち手部分
// - 厚さ1cm

module cup_base(buttom_r, top_r, height, thick) {
  polygon([
    [0, 0],
    [buttom_r / 2 + thick, 0],
    [top_r / 2 + thick, height + thick],
    [0, height + thick]
  ]);
}

module cup_diff(buttom_r, top_r, height, thick) {
  polygon([
    [0, thick],
    [buttom_r / 2, thick],
    [top_r / 2 , height + thick],
    [top_r / 2 , height + thick + 0.1],
    [0, height + thick + 0.1],
    [0, height + thick]
  ]);
}

module handle(
  cup_top_r,
  cup_thick,
  handle_height,
  handle_width,
  handle_base_length,
  handle_thick,
  handle_start_len,
  handle_end_len,
  handle_end_height
) {

  union() {
    translate ([0, - handle_width / 2, handle_end_height]) {
      cube([handle_base_length, handle_width, handle_height - handle_end_height]);
    };

    translate ([handle_base_length, handle_width / 2, handle_height]) {
      rotate([90, 0, 0]) {
        linear_extrude(height = handle_width) {
          polygon([
            [0, 0],
            [handle_start_len + handle_thick, 0],
            [handle_end_len + handle_thick, -(handle_height - handle_end_height)],
            [handle_end_len, -(handle_height - handle_end_height)],
            [handle_start_len, -handle_thick],
            [0, -handle_thick]
          ]);
        }
      }
    }
  }
}

// カップの底面の直径
cup_buttom_r = 8;
// カップの上面の直径
cup_top_r = 10;
// カップの高さ
cup_height = 10;
// カップの厚さ
cup_thick = 0.5;

// 持ち手がつく高さ
handle_height = 8;
// 持ち手の太さ
handle_width = 2.5;
// 持ち手がつくブロックの長さ
handle_base_length = 7;
// 持ち手の厚さ
handle_thick = 1;
// 持ち手の保持部分の開始位置
handle_start_len = 3;
// 持ち手の保持部分の終端位置
handle_end_len = 0.5;
// 持ち手の保持部分の終端高さ
handle_end_height = 1;

difference() {

  // カップと持ち手を結合させる
  union() {
    color("red") {
      rotate_extrude() {
        cup_base(cup_buttom_r, cup_top_r, cup_height, cup_thick);
      };
    };
    handle(
      cup_top_r,
      cup_thick,
      handle_height,
      handle_width,
      handle_base_length,
      handle_thick,
      handle_start_len,
      handle_end_len,
      handle_end_height
    );
  };

  // ペットボトルが収まるスペースを抜く
  rotate_extrude() {
    cup_diff(cup_buttom_r, cup_top_r, cup_height, cup_thick);
  };

}


