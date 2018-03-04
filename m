Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;        bh=x40lEmVLrlu4/rqZfjlA3IlbBZu+IZro7sCEMqAIscg=;
 b=CfWr1JKE4fTMcSp03sjOZQUYZyUPu7HtuarV390ReEuGg4QrJfZOzSNnFlSBHtIZRK
 8alIOwNbFcj60t7NG+sF+lfpQLP5eVclm+NvQb+A53DWlbDIJ6LoeM/1YEutwuAySK8w
 yTmp/s6qe44aAd4eAmf3L8f8NXEnmHtbTMWRpPIWCNdJgLUBP3EBHKo132CEwoYO5AY7
 CaivpYEQrJ3UA/ArF79zLl5Iw6zfTMzeS1CwTbNHVL331XHpKlyomShW02oSXvBa/2Ey
 7RmhauhkHhoVRDPDto5puBMEZMuTDovVyDTqXA8G1U2yKT1D/LyPY6doAX3rW0pnwh89
 uRRw==
Date: Sun, 4 Mar 2018 10:13:05 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: smp_read_barrier_depends() into READ_ONCE()
Message-ID: <20180304021305.GA4449@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi paul,

Please provide the commit link/hash for the changes of
smp_read_barrier_depends() in the kernel. I remember that it was post by Akira
once on the mailing list, but not sure I can get the right one.

Thanks,
Yubin

-- 
Yubin Ruan <http://fastdrivers.org>

