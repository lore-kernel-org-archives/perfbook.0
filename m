Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Yx8AjBUtjbc9FhEIc4h8s0GXTGf8JUjpI+4ecnNg8ok=;
 b=eYG+I1MbHDzau2bBRUUJDkmnUY2j2Zg09eHf32TNCOWjFVXrjRrn57nEMsU0ZLSYII
 KaEGZAMrJsh2p02U7/vlchElDGHt3sFuPUWRcUEXXGrZ1WIi7TYaA9RMEQXyKMZsVh1B
 FtnigLxMK19NzMuzb/MeCcnhShvCTxH0Tpu8LxPUaZJg/afM7JZivV+zsK52t/K46vSO
 CVKr5H+pVqt5js4yCAaAhoHn5G4D6Ac8zsRn0CYMUNRYGJqqB49/YyNcuCMnYaXJAZq6
 mtZgcDsaf9I6cnvhGXNjI0I+l2b3Vg3/6zm9Di8miT63LYbAmDTAsmmsMR4kq9Mmi7TD
 vPOg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Question on updated Figure 5.1 "Atomic Increment Scalability on Kaby
 Lake"
Message-ID: <1ac811fa-ad08-43aa-ac74-e6367c33e742@gmail.com>
Date: Sun, 2 Sep 2018 17:54:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Palik, Imre" <imrep.amz@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hello Palik,

I'm looking at Figure 5.1 of perfbook which was updated by commit
3b62f67a76e1 ("Regenerating the atomic counter graph on a more
modern CPU"), and wondering the time to increment at x = 1 looks
too small.

As is described in the Answer to Quick Quiz 5.8, atomic increment
should take a bit longer than the ideal non-atomic increment even
when the number of updaters is 1.

Or on Kaby Lake, some special optimization results in almost no
cost in this case? If that is the case, the Quick Quiz needs update...

Also, the horizontal dashed line should be closer to the x-axis,
I suppose. The time of the ideal non-atomic increment is embedded on
line 44 of CodeSamples/count/plots.sh as "8.81772".
You might need to use a proper value for Kaby Lake (should be near
zero) instead.

If I understand the circumstances right, raw data for the previous
version of the graph reside in
CodeSamples/count/data/count_atomic:u.2009.05.03a.dat.

Can you share the corresponding raw data on Kaby Lake?

Also, in the above mentioned commit, atomic125.{eps|png} were
overwritten accidentally. They were graphs of 125-thread case,
and should not have been updated IMO. They are not used in perfbook
at the moment, but I'd like to have the original ones in the repository.

If you could share the raw data for Kaby Lake, I'd be happy to fix
these issues for you. 

I'm not blaming any of you. I could blame the ad-hoc design of plots.sh,
but it was written by Paul for his own use. Such scripts tend to be
ad-hoc. ;-)  I might be able to improve the script.

        Thanks, Akira

