Return-Path: <SRS0=OLMn=NZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a1V6dkrUycAWjqSYBQHpaWEJ5nAVLQ0TU9lcXhQtE40=;
        b=q1Tih3JcChvrmBqiY3bB03GkK/yOI7GvbfRSshO34e6LlDJTlBleM2razauP9aBdwb
         oOnCXM0PKn4TkWBuNaJm1lDepqpkBuXgScXss/AxUMVLRvGS603lKuPEQ6ocbb/UZg/j
         lilDPlNORgV8nS+GG6OmoXsy288RM3KmgnB1joHFK6YaWipEusc8WONmqXPINb3HoHDJ
         4DwY/va+05awL6lh038oj52b3wW30kNNIqNPctX+TlJBRe8/KxmOkQtbH/eAEYI5eQli
         Z4mGCDuhJ/uPhZTbG8ZhpcYp+PANBb1wEMxcil41c8iERr2gFZKpnUZILs3fm3I9PM31
         cMvw==
Subject: Re: [Suggestion -perfbook] Abandon font embedding by gnuplot
References: <ad13ea5f-1c9e-2da8-5ca3-8abcaab99122@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <315feb80-efbe-58ba-31cf-9a67a0c0b7fd@gmail.com>
Date: Fri, 3 Sep 2021 18:49:30 +0900
MIME-Version: 1.0
In-Reply-To: <ad13ea5f-1c9e-2da8-5ca3-8abcaab99122@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 3 Sep 2021 17:45:13 +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> When I tried to run gnuplot under formal/data/ on a smallish Fedora
> container image to test the update of Figure 12.10, it failed with

                                        (typo) 12.4

> the error of:
> 
>     sh: line 1: pfbtops: command not found
>              line 0: Command 'pfbtops /usr/share/texlive/texmf-dist/fonts/
> .../uhvr8a.pfb' genereted error, exitcode is 32512
> 
> It turned out that I needed to install groff.  And gnuplot ran happily.
> 
> While I looked formal/data/plot.sh, if I removed the options:
> 
>     enhanced "NimbusSanL-Regu" fontfile "${font}"
> 
> in the first line of gnuplot instructions, gnuplot ran fine without
> groff installed.
> 
> I think the fontfile option is for embedding font data into .eps
> files.
> 
> Now we are doing .eps -> .pdf conversion via a2ping (or ghostscript),
> so I don't think font embedding is necessary.
> 
> Furthermore, gnuplot's default of Helvetica font is overridden on-the-fly
> by fixfonts.sh and its friends.
> 
> So there is no concern of embedding Helvetica font in the generated
> pdf figures.
> 
> In the test on my side, generated pdf figures have the same font
> properties regardless of the fontfile option.
> 
> So I'd like to ask you if it is ok to remove those fontfile options
> in the plot scripts under CodeSamples/.
> Removing them will reduce .eps file size and hopefully might reduce
> time of (the lots of) .eps -> .pdf conversions.
> 
> Side note: plot.sh under formal/data should be moved under
> CodeSamples/formal/ for the sake of consistency, I suppose.
> 
>         Thanks, Akira
> 
