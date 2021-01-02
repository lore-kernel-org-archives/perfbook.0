Return-Path: <balbi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609614880;
	bh=45qNxb36ogxsBobVm0i4ykF9lN5hP2M5d0JjhWnyLh0=;
	h=From:To:Cc:Subject:Date:From;
	b=BLtAxjkbA4uj2mU0qZOz8om0y8z+tKL1gg7QSTK1YUgU5rdwGiPvjOxBfQdvnT2ZL
	 33DqwbvxptLSvPclrE4e/e0oCefLT1JsZ/VrAGTRh5j1drW56hSItNWIsd9UT3ktAo
	 aLPEHGy3jx5zAdMRygRfAKZl3Gn6JEszI2AQxO/xsffi7W/7CY0Rak3rvPC7dnx5AQ
	 fw5MMXmB889NhJFZzvj7eMwirFnOdC/j0bOglPCq6vFlOAWxibySqblFMShBdkbNKy
	 6CsWRS+MuPE0qPhHSrhWXTHE8l6ZUnUBpFez7wOFWYtZgx1cPvbhvH543I8CuhQTcd
	 Mhkmh3zbj9z9w==
From: Felipe Balbi <balbi@kernel.org>
Subject: Perfbook build failures
Date: Sat, 02 Jan 2021 21:14:34 +0200
Message-ID: <8735zj40dh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi all,

I'm trying to build the perfbook, but I always get a build failure while
building the Dining Philosopher's images, as shown below:

SMPdesign/DiningPhilosopher4part-b.eps --> SMPdesign/DiningPhilosopher4part=
-b.pdf
SMPdesign/DiningPhilosopher5.eps --> SMPdesign/DiningPhilosopher5.pdf
SMPdesign/DiningPhilosopher5PEM.eps --> SMPdesign/DiningPhilosopher5PEM.pdf
SMPdesign/DiningPhilosopher5TB.eps --> SMPdesign/DiningPhilosopher5TB.pdf
make: *** [Makefile:400: SMPdesign/DiningPhilosopher5TB.pdf] Error 1
make: *** Waiting for unfinished jobs....
make: *** [Makefile:400: SMPdesign/DiningPhilosopher5.pdf] Error 1
make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Error 1
make: *** [Makefile:400: SMPdesign/DiningPhilosopher5PEM.pdf] Error 1

Any ideas on how to debug this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/wxhoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ6Pg/9GMGCYEthZ0DGAvdEVVu7ZEpEcJG06Klq
QYjozBccl0yhH4SeSEzgHKcSV8qH/YVbroyhrijsxgaNfaVHSAe8GubP4VWWNCvQ
4Jv6Xg8HaXusRimC8FulYyVAGznAfmOrAYT9sHpTOsh2ZXvvLqVncBNVm/lX2XyZ
kZ9UDo5Ri3y2mqRb1IfHGD6nKETopT7s5psXo3+wfax+Aj5A1A5+bkqePWSo1G/D
Ta7nFgDdxVFw0FQDZEp3vS2GHWFB+jiPZI/2vQDHuMYmfErpVkwHQe6J2p9lZCZk
IoRYlqxlnrwsVEa1t5GsvdE2S/4S3Wxhuj+dAfXtNgch4Xme8i8ugBOSZ8kp+DWg
lfev6k4oDgmSR6tExZxeLor4KTgplAiDcA0z7EZO0erop8PtQyAmYNRsew6pePjs
+LgqXHPZnhdv5oXd/61CHJxJw0XaO1KRw0L7o5senTqvB9M54tbhalVb4mm0ruGe
A5mdtbNedAUOzHry9+KlFkDgXrjnr7x9VJ0J+6/je4X5SEfWK7qr8olKOFRsX3up
8MgeazvOgzQsn7ok+Jj8OZ68LcFs0pfXjGbFpdFcKDBbd0ra/oP/lrV2S9ndIXRd
j5tm7+06208N1OyGjP7f0poG0dK/bHKatJIt/eEkqQrSJMgdLS+VNzbmQRpEYkKA
h9TSiPNWx4g=
=g8+j
-----END PGP SIGNATURE-----
--=-=-=--
