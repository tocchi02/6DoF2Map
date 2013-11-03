function quat = dcm2quat(dcm)
	% 方向余弦行列からクォータニオンを算出
	% quat:クォータニオン, dcm:方向余弦行列
	% degreeにするにはrad2degの	matlab関数を使う
	% 以下参考
	% http://www.tu-berlin.de/fileadmin/fg169/miscellaneous/Quaternions.pdf
	% http://www.mss.co.jp/technology/report/pdf/19-08.pdf
	q0 = 0.5 * sqrt(1 + dcm(1,1) + dcm(2,2) + dcm(3,3));
	q1 = 0.5 * sqrt(1 + dcm(1,1) - dcm(2,2) - dcm(3,3));
	q2 = 0.5 * sqrt(1 - dcm(1,1) + dcm(2,2) - dcm(3,3));
	q3 = 0.5 * sqrt(1 - dcm(1,1) - dcm(2,2) + dcm(3,3));
	quat = [q0; q1; q2; q3];
	[x, ix] = max(quat);
	switch ix
	case 1
		quat = [q0;...
				0.25 / q0 * (dcm(2,3) - dcm(3,2));...
				0.25 / q0 * (dcm(3,1) - dcm(1,3));...
				0.25 / q0 * (dcm(1,2) - dcm(2,1))];
	case 2
		quat = [0.25 / q1 * (dcm(2,3) - dcm(3,2));...
				q1;...
				0.25 / q1 * (dcm(1,2) + dcm(2,1));...
				0.25 / q1 * (dcm(3,1) + dcm(1,3))];
	case 3
		quat = [0.25 / q2 * (dcm(3,1) - dcm(1,3));...
				0.25 / q2 * (dcm(1,2) + dcm(2,1));...
				q2;...
				0.25 / q2 * (dcm(2,3) + dcm(3,2))];
	case 4
		quat = [0.25 / q3 * (dcm(1,2) - dcm(2,1));...
				0.25 / q3 * (dcm(3,1) + dcm(1,3));...
				0.25 / q3 * (dcm(2,3) + dcm(3,2));...
				q3];
	end