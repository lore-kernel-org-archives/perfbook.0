Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=roI1+1FYBjbKC0/+599EX8SfwSvzUAUFVHtzw0LCTP8=;
 b=pFTIbmoKNXlzJr9nk7i/g30zqNlTp+tXQcPmJSWGa4Q2J4asijKuPOJ1A4sky+J2Vh
 HgiGula6/umrKRRoMBZ+uT+9/f2YnPugfPu7evLYrN4ZhtHXWyHyIoImVOyKg+WXiXAT
 Fbp6K8zu0TFzJt6yOEQD7Jc3n7bgQlsX1cLx0PGbMGGjuRNqblCdbHum1U63b/J6tpOP
 9ytxBiMOlxkyn9YcBv5IjAW2svdOc3WuhxlPanfjK0TRONrtPXIgy8qT4QjDqIYkxrKG
 lWDRygbfnH89S8PQLsUqfiKjJpruEBkLm++47fz1qVj5bSa3RcoAyC/tXGGlOAh4jFTv
 Bgtw==
Subject: Re: [PATCH] advsync: Another fix to use latex reference feature
 consistently
References: <57087D07.6030207@gmail.com>
 <alpine.DEB.2.10.1604091434270.32362@hxeon>
 <20160412160027.GH3568@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <570D738E.4000905@gmail.com>
Date: Wed, 13 Apr 2016 07:15:42 +0900
MIME-Version: 1.0
In-Reply-To: <20160412160027.GH3568@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi, Paul,

On 2016/04/13 1:00, Paul E. McKenney wrote:
> Akira, in the future, please do use "git format-patch" and also please
> use the Linux-kernel preferred format for referencing commits, as shown
> in the updated commit below.  The idea is to use the first 12 digits of
> the SHA-1 commit ID, followed by the subject line in both quotes and
> parentheses.

I see. I'll do so in the future.
In fact, I *did* use "git format-patch", but copy & pasted part of the
output. I also edited the commit message just before sending it out.
I won't do that.

BTW, are you interested in a cosmetic patch which would make Section
14.2.9 "Guarantees" looks much denser by reducing vertical spaces above
and below code examples?

If it's worth doing, I'll try tuning them this weekend.

Thanks,

-- 
Akira Yokosawa <akiyks@gmail.com>



