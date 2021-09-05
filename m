Return-Path: <SRS0=3Rud=N3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gjwmNHnzYSqCqzBRpTHkZ3JS/PRRA7VqlQ163KO8d/Y=;
        b=eVeeb6vdIeNpw1uAcWlZSqVJbtoLxPBQXP0OrjiRDQYHIpg92rQg3dUooiMUW+JyUg
         eP/Mtvk2G/NCUNYw8SpoJZP6WXfaWf3NOhfa6U+GFfgsGairPzjn4HI0lXA6s1O87oNc
         VOu4+9uPSIy948YTf5g9klXjZa92AghXKX7CONOJpWkHzLzYy08K55zVQMus/rejPUc5
         UapfzieSsr0G2K2Qnt5YpYFsc7aL4ytruGpOpuPDqJFh2VtCrez+Et4IUvW6E6hwHfaY
         JtnIrm0cR+n3N6Qf7qaT23qxSrIqKfXm/kEOB/rdPPh4fPisWBa5cBDFih6HyZvIuGdZ
         hBzg==
Subject: Re: [Suggestion -perfbook] Abandon font embedding by gnuplot
References: <ad13ea5f-1c9e-2da8-5ca3-8abcaab99122@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8385ce6a-f313-6c8a-d171-bf5a5f868ec9@gmail.com>
Date: Sun, 5 Sep 2021 20:05:44 +0900
MIME-Version: 1.0
In-Reply-To: <ad13ea5f-1c9e-2da8-5ca3-8abcaab99122@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 3 Sep 2021 17:45:13 +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
[...]
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

Well, in reality, eps -> .pdf conversion takes longer when
the fontfile option is removed.
I guess this is because ghostscript needs to fetch a proper font
file on the system to embed used font data into PDF.

So, I'm retracting this suggestion.

Sorry for the noise.

> 
> Side note: plot.sh under formal/data should be moved under
> CodeSamples/formal/ for the sake of consistency, I suppose.

I'll try this directory move.

        Thanks, Akira

> 
>         Thanks, Akira
> 
