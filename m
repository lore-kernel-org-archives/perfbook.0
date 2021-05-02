Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230110AbhEBQjc (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 2 May 2021 12:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619973520;
        bh=H3wC3XdYLDpTzYVbtVEULWg2SaSZP1g2fsGnLeUeLJQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QbhvtSfVmZSC6ItFWWXt2aTVhziynJ7TElGBPX+14JbeEhRxlB9bhFj9gSbnkBzSo
         UVAd1ktL/yTaS0i9cwj/jmoTrORYYdnN/gsiMAdI0SlTB1R12pzNDB8iwTmaKmj8dj
         ao14s4MYpq0S6DSP8q+idud92pr0fH81U1IPIku6ziyoTgAsmkSrNnJzZo6XDcunRj
         g2/8Mrsr0UrwrCXI/0j06NKQOcU2o6XGJAdoh6rIYIQH6OGbKpT1ofMPj7tsqo5Pg+
         3Xw1y1OFHALBcvgzp7VlLDASHkKBPBFL3U7evr8xyBRyswW9rFVYkZ4W8Uv18xEprz
         f5vvz5DRN3hDA==
Date: Sun, 2 May 2021 09:38:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] utilities/autodate.sh: Fix potential hung-up
 on missing tcolorbox
Message-ID: <20210502163840.GO975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
 <0b71604e-5b51-c53a-57ce-d97a7dbaf620@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b71604e-5b51-c53a-57ce-d97a7dbaf620@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 02, 2021 at 08:59:43PM +0900, Akira Yokosawa wrote:
> On Sun, 2 May 2021 20:40:42 +0900, Akira Yokosawa wrote:
> > "kpsewhich tcolorbox.sty" can be empty if tcolorbox is not
> > available.
> > 
> > If this is the case, "grep" in `grep ProvidePackage | sed ...`
> > will wait forever.
> > 
> > Add an empty check in front of "grep" with exit code of 1.
> 
> Paul,
> 
> Please ignore this patch.
> I'll respin soon.
> 
> Sorry for the noise.

Ignored, and no problem!  Been there, done that!  ;-)

							Thanx, Paul

> -- Akira
> 
> 
> > 
> > Fixes: b2f19231bcc5 ("utilities/autodate.sh: Make newer tcolorbox behave as before")
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  utilities/autodate.sh | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> > index 7bd7cbb8..2b9c1117 100644
> > --- a/utilities/autodate.sh
> > +++ b/utilities/autodate.sh
> > @@ -97,6 +97,13 @@ env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
> >  
> >  # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
> >  tcolorbox_sty=`kpsewhich tcolorbox.sty`
> > +
> > +if [ "$tcolorbox_sty" == "" ]
> > +then
> > +	echo "Error: package 'tcolorbox' not found. See See #9 in FAQ-BUILD.txt" >&2
> > +	exit 1
> > +fi
> > +
> >  tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
> >  tcbold=4.39
> >  env printf '%% tcolorbox version: %s\n' $tcbversion
> > 
