Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=DxbVUrECjbVqSUpeKmwC4G49tiX4/PTNEMkyDmyXQks=;
 b=Bog9dhiZPm7IjaHa6eu/SLlEoq/KoKzNPrBSDW1kYTSx994hj0Ot+h/iGpg/+icstM
 QJKA3K7FVNy3EFnDktv7VgiZAHckTbx/b24snkjw0RgyDutsXRyFfoi7DtkARx+Gjjey
 hFt0ZM/74yrMDl/MB4R4ZMWJAjoRgyS8ylmNrRwVbsd06s/3qnY5DpokKuSnr/zUOgLZ
 +jAjLNiwG6dyVYP+ImBuv/Hq01m9P+V4v+d55LD1dfx7BIFp+GKItoR4xUiKEPxvXQiq
 7nykTbgXUkGXyNfr614KiT8iqp3szfTQy3l5eqe1kc34HECpbdeYJJI/6qv30KMtXOs7
 P5+A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL] SMPdesign: Use subscript in lockdeqhash figures
Message-ID: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
Date: Sat, 6 Aug 2016 19:07:29 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is somewhat related to the "using hyphens for minus signs" issue.
In Figures 6.8 and 6.9, entry names such as "L-2" are used.
The "-" here means minus, but it is *not* obvious at first glance if
it means "L minus 2" or not.

If we make "-2" a subscript, it would be much easier to see that
it means "L whose sequence number is 'minus 2'".
So, I tweaked the xfig sources of the figures to make those numbers
in entries look like subscripts. I also altered the numbers in entry names
mentioned in the corresponding text as subscripts (using math mode).

I'm sending this as a pull request as the resulting patch became fairly
large due to eps files.

I hope you like there tweaks.

Additional patch is a fix of entry numbers of Figure 6.9, which is
actually 16 if my understanding of the figure is correct.

                                             Thanks, Akira 

---------
The following changes since commit ec15e80376f04f5b2be8779aedfda3ba184a4e37:

  Fix URL for MathieuDesnoyers2009LFCollabSummit (2016-08-05 13:12:07 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git lockdeqhash-use-subscript

for you to fetch changes up to 7893124def444db34fbb6bc2b4e9b2f20675c2eb:

  SMPdesign: Fix number of elements regarding Figure 6.9 (2016-08-06 18:14:07 +0900)

----------------------------------------------------------------
Akira Yokosawa (2):
      SMPdesign: Use subscript in lockdeqhash figures
      SMPdesign: Fix number of elements regarding Figure 6.9

 SMPdesign/lockdeqhash1R.eps   | 330 +++++++++++++++++++++++++++++++++++-------
 SMPdesign/lockdeqhash1R.fig   |  39 +++--
 SMPdesign/lockdeqhashlots.eps | 323 +++++++++++++++++++++++++++++++++++------
 SMPdesign/lockdeqhashlots.fig |  48 ++++--
 SMPdesign/partexercises.tex   |  14 +-
 5 files changed, 622 insertions(+), 132 deletions(-)

