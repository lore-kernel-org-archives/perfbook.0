Return-Path: <bsingharora@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eF5r60cT33mgY1fmYZsR8pg06jarPew0S8mHp5g8qeg=;
 b=wiiPNdYnUBmaM0EqV8hwax3GloOTUH7u8xdLvGOg9ewMp3XYFP+e0v+ioOMzM2xEuS
 iTO8Abo2Z6Btb3HONrAc8FE/yvaUFkZyecx6DcU07ySjWniQHP8yBwoy0yUIQVKFi+zk
 OBiEw8jdaF1dbkDqGPxxdO+Qr5dVQjfs1ETY/gFbhN7Cv7LI6tCG2D4mKh2F6OTmjDE0
 pfDffYxbmPq3uxozVFgirdMsvZra5tz4PDLtHFcOPPDqwIQlUbcTBaMQUsxS9VT1ZeEK
 AI9Y/PMm01HfVN/GxoQJlOMP3TNO73gvcwO7v9hNtMVRgBjfJRsSwHYnyRWmheKZe7ZT
 5rmw==
Message-ID: <1470125114.3000.7.camel@gmail.com>
Subject: Re: Memory barrier -- fix sample code
From: Balbir Singh <bsingharora@gmail.com>
Date: Tue, 02 Aug 2016 18:05:14 +1000
In-Reply-To: <20160802040204.GY3482@linux.vnet.ibm.com>
References: <1470097946.3000.3.camel@gmail.com>
 <20160802040204.GY3482@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, 2016-08-01 at 21:02 -0700, Paul E. McKenney wrote:
> On Tue, Aug 02, 2016 at 10:32:26AM +1000, Balbir Singh wrote:
> > 
> > From: Balbir singh <bsingharora@gmail.com>
> > Date: Tue, 2 Aug 2016 10:26:34 +1000
> > Subject: [PATCH] Correct a sample in memorybarriers.tex
> > 
> > We probably don't want to show GFP_KERNEL allocation
> > under spin_lock, GFP_ATOMIC seems much better.
> > 
> > Signed-off-by: Balbir singh <bsingharora@gmail.com>
> Good catch, applied, thank you!
> 
> However, I had to apply this by hand due to some recent mass changes to
> figures containing code.  Could you please move to current perfbook.git
> for future submissions?
> 
> 							Thanx, Paul

I thought I did a git pull before patching.

My git-head pointed to 413b7bc1cf6d65368300e96016ac15ac728b66fd

I'll double check. Thanks for applying it by hand

Balbir Singh.

