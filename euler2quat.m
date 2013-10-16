function q = euler2quat(euler)
% オイラー角からクォータニオンに変換
% z-y-z形式
	s = sin(euler./2);
	c = cos(euler./2);
	q = [c(1)*c(2)*c(3) + s(1)*s(2)*s(3);...
		 s(1)*c(2)*c(3) - c(1)*s(2)*s(3);...
		 c(1)*s(2)*c(3) + s(1)*c(2)*s(3);...
		 c(1)*c(2)*s(3) - s(1)*s(2)*c(3)];