Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jVkK18iVlwWGrjRqNaBE3xkZFHzrZuh1eMOwkhM3jXc=;
 b=j9Dp/fd4ba6a70VTa9bHiDedS8ytnLuSNY+tn2t7UdJRHj3BeZpRFTLMwMLCCoCVN6
 uCsAX1jWHSjhV1nVaHYkY66IC3snhv8U0WQDhTbxej795oDy+iKxLK3KIHpV/gxHzr4u
 3vXiGfRROWlN4XFbyL5w6hmz34rPklGxsBupgnPmzoDpaXojzjD54J93PhK1As/feNsC
 oKCeRlvQcTTkUoP79oBTBnMqcSlGYQscG9QqcfZCBVSSoenoINMMo3+xpj+3IE8tL9CB
 4uY+5NUCt/mXPOnlTizftXwY7kC5Mrt/+o18mHMJY3TD0jVlANCFqX9hildihBNShAd0
 8taw==
Subject: Re: build fail on ubuntu 16.04 LTS
References: <b8c743ec-4415-86d3-a580-def8b4051a5d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6e48f846-88fb-631f-05ba-6d72fcb63ca6@gmail.com>
Date: Sat, 18 Feb 2017 00:13:32 +0900
MIME-Version: 1.0
In-Reply-To: <b8c743ec-4415-86d3-a580-def8b4051a5d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/02/17 22:45:04 +0800, Yubin Ruan wrote:
> The build script fail with
> 
>     pdflatex 1 for perfbook.pdf
>     ----- Fatal latex error, see perfbook.log for details. -----
>     Makefile:83: recipe for target 'perfbook.aux' failed
>     make: *** [perfbook.aux] Error 1
> 
> I have attached the `perfbook.log' file.

Hi Rubin,

The build failed because LaTeX style file "couriers.sty" is not found
in your TeX Live environment. It is logged near the end of the log file.

> ! LaTeX Error: File `couriers.sty' not found.

Please refer to item 5 in FAQ-BUILD.txt for necessary packages on Ubuntu.
It mentions Trusty, but the same packages will do on Xenial.

> 
> In addition, it keep complaining like
>   "WARNING: Refer to utilities/mpostcheck.sh for texmf config fix."
> What is going on?

Well, as the message says, instruction to plug the potential vulnerability
in TeX configuration can be found in the header of utilities/mpostcheck.sh.

Hope this would help you.

                               Thanks, Akira
>
> regards,
> Yubin Ruan
> 

