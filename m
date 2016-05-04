Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=wnBlFXGrlGRWvqkBQuGvyE/WgKZ3y1XJujDpl3QNEbA=;
 b=r3FBPa92zhyE2leE1JyFJIM5AK3ZSXD2v9lB4D/ebBLoErcynjOe843xlDqp2/V1/7
 YSAw1KP5pJIO12DGWQevU7zGC6h3Xb5BsdkfxMrdAAVAm1kWaqBH1EWV+edBEWz6reZ2
 mJUkZLs4bdGUgSkCJPku8CQYZ2GT9L+2lJoNvan+Zybel2APIfZyFtU17EQja9GL013b
 BpL+VPcRFmc3EmKJOC3sMNXNXCZtQNiVsNI4FXPEFsYkAO2RrW/L+MB0g+sgY3npx27I
 1SHfuEZCB61vgKstKJ1NXuRLNzdeDykrPpp9KBiaMzom8zibhNxIQT2WJL9XutN3hM46
 /n0A==
Subject: Re: [GIT PULL FOR TEST v2] Another round of build script tweaks
References: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <13c274c8-bde5-b13c-7c1b-64731a2298c2@gmail.com>
Date: Thu, 5 May 2016 08:35:45 +0900
MIME-Version: 1.0
In-Reply-To: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/05 0:39, Akira Yokosawa wrote:
> Hi, Paul.
> 
> Finally, I set up a GitHub account, and pushed v2 of the series
> "Another round of build script tweaks".
> 
> Please pull this into your local test branch and take time to see if
> it actually works as you would expect. I'm fairly certain there would
> be some regression, especially in the final commit 92ae43c3a72a
> ("Further improvement of build scripts").
> I'm also concerned about the fix of sig-theft.dot.
> 
> Changes from v1.
>     Reorganized the entire series so that minor changes would come
>     first.
> 
> Note: While I set up the account, I noticed a typo in my git-config
> setting of user.email.  My email address in the commit messages so
> far was wrong. Sorry for the slip-up...
> 
>                                                 Thanks, Akira
> 
> ---
> The following changes since commit 3f8bb7d620edee44637be00ba738761a4fc0732e:
> 
>   .gitignore: Add planned empty targets (2016-05-03 17:49:50 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git makefile-tweaks-v2
> 
> for you to fetch changes up to 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:
> 
>   Further improvement of build scripts (2016-05-04 23:43:06 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (7):
>       Add font installation check
>       Add short name targets in Makefile
>       sig-theft: Fix .dot source for dot - graphviz version 2.36.0
>       Make default target of "make" overridable
>       Makefile: Reorder rules
>       Makefile: Use wildcards
>       Further improvement of build scripts
> 
>  .gitignore            |   1 -
>  FAQ.txt               |  23 ++++
>  Makefile              | 336 ++++++++++++++++++-------------------------------
>  count/sig-theft.dot   |  17 +--
>  count/sig-theft.eps   | 338 +++++++++++++++++++++++---------------------------
>  utilities/eps2pdf.sh  |  12 ++
>  utilities/runlatex.sh |   9 ++
>  7 files changed, 333 insertions(+), 403 deletions(-)
> 

There was a regression in Makefile that prevents build after "make distclean".
The fix is pushed.

--- 
The following changes since commit 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:

  Further improvement of build scripts (2016-05-04 23:43:06 +0900)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git makefile-tweaks-v2

for you to fetch changes up to c496b1d5c45dec5401658449d049d2b4e70148c4:

  Fix regression in Makefile (2016-05-05 08:23:46 +0900)

----------------------------------------------------------------
Akira Yokosawa (1):
      Fix regression in Makefile

 Makefile | 1 +
 1 file changed, 1 insertion(+)

