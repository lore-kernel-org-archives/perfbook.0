Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbfKDHwa (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 4 Nov 2019 02:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572853949;
        bh=RY5skKGFi/Bms4WbP6JzmrvHXmClkzHgmrYo48j8qG0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=VTRtq40zs//OsPu1B+JPqokwqJYZQZyzSw9G1LOsP/TJVhV/g0WYxo0E4vvBoivjt
         n7VoBhYGdMT6W/5Xdn9SGjifs019/yfBeZL0gQ1Qu8p0ee+L50gDeG+DNOLbxIEJEC
         EZorzI2RJvtYet0wP+GiYk6vkwaAY7nu+OCW2R1s=
Date: Sun, 3 Nov 2019 23:52:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [perfbook GIT PULL] Improve detection of incompatible LaTeX/font
 packages
Message-ID: <20191104075227.GX20975@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <75ed5ee1-2e1a-4aa4-8e24-dbcc9fa7850a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75ed5ee1-2e1a-4aa4-8e24-dbcc9fa7850a@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 03, 2019 at 10:32:40AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Recently I found out a regression on Ubuntu 16.04 which has a buggy version
> of titlesec. The bug omits section numbers in section headers. If you were
> on Ubuntu 16.04, you might have noticed the regression.
> 
> In response to this regression, I tested perfbook build on some of old
> TeX Live releases.  There were other incompatible packages in the past.
> So this series adds/improves detection of those incompatible versions.
> I have tested the detection on TeX Live releases 2013, 2014, 2015, and 2016.
> (2016 is slightly later than the 2015/Debian of Ubuntu 16.04.)
> 
> I also updated FAQ-BUILD.txt to reflect the added checks. Now it
> emphasizes upgrade of TeX Live. For those who don't like to install
> the whole -fonts-extra package, the list of font packages not included
> in -fonts-recommended has been completed. 
> 
> I also updated FAQ-BUILD.txt to add notes on Fedora issues I found out
> while I tried newly released Fedora 31. There are a few glitches and
> all current Fedora releases (29--31) has a regression of Ghostscript
> affecting (may be not limited to) Figures of gnuplot.
> 
>         Thanks, Akira
> --
> The following changes since commit ff868f8213a26d2a75619973e59b4f33a61a97e5:
> 
>   defer/rcuapi: Add pointer to additional hlist_nulls documentation (2019-11-01 07:21:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2019.11.03a
> 
> for you to fetch changes up to 03377d5e27aed775c34663a31661f4796b33c170:
> 
>   FAQ-BUILD: Add note on Fedora's Ghostscript regression (2019-11-03 08:53:46 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (9):
>       runfirstlatex.sh: Detect warning of incompatible package version
>       Specify required version of 'titlesec' package
>       runfirstlatex.sh: Add check of buggy 'listings' package
>       runfirstlatex.sh: Add version check of newtx package
>       runfirstlatex.sh: Improve detection of incompatible packages
>       FAQ-BUILD: Update notes related to added checks
>       FAQ-BUILD: Update on Fedora 31
>       Makefile: Add existence chech of 'newtx' and 'courier-scaled' fonts
>       FAQ-BUILD: Add note on Fedora's Ghostscript regression
> 
>  FAQ-BUILD.txt              | 111 +++++++++++++++++++++++++++++++++------------
>  Makefile                   |  10 +++-
>  perfbook.tex               |   2 +-
>  utilities/runfirstlatex.sh |  37 +++++++++++++++
>  4 files changed, 129 insertions(+), 31 deletions(-)

Pull, thank you, Akira!

							Thanx, Paul
