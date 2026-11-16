Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804069;
	b=WTW0j7vycPCy7oFaIJvijwlkkOgnJR4GFi5iFCKQwr3RyFJBwalp8O2BwWeoiMj2q/7F
	 1G7CjqnTg6akLBAX3RK8F5LBe0D5p/MCRoKZSDfWryysAjlJz/+wp1fmE2r8E/WyOyNtg
	 trN8K4QdKl7AXocu9NhbhSsOGPcu326Q3bjTXX+O7UorGzbUo0C/jeQtZRWESsSaLvqDI
	 5jZljfknzYA+v/lrlEAfR0Qrg/PGeDnhxaS+mpjy7InxhdYa5Bd+HP3fZwx/zB0i3kg97
	 kurL/UkELvmIpS/b6i5rC3amZ4VTnMkMHyS1ANv8ArePoGJ/OdFEZJjKqUn7RFDdS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GXm1wTFyO69aX+DG2iMDTFYiG3Wmg4Atekg/Ge8fcZ8=;
	b=d/Rhx631u1JiT/XEZGG6HDRyMFTSROLb4QZigJoMLnDcYB8+/MT6yHH2lc9RvtYowKwt
	 XUbSr9WuQnvPEKXueYVPk8edw/qTU/rjbPH6GbQEriFLrfsBZij4FDKRkxuCeB8sAUTA9
	 Hwi5jgL45QcYlf0lrlnrRVN4hKOzbGmxvGOvmjE4PppD8g1EKTYyBoWF8EZszUYLmYvir
	 Zt9kbIx/FKyejd2GcaXzd7XqosrU8U6FGu8+hk/3H6d7FO5sjfvZIMmDrXggGHXEypHYm
	 gn5V1oMLAMFQapmZYcwnckI7tlu3buIQ8uEISzGsVMoLbjYvzxa6R2zqmoSfwLHSRLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j97Y0PdK;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7C606A31C
	for <perfbook@vger.kernel.org>; Mon, 16 Nov 2026 04:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j97Y0PdK
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so2683240b3a.1
        for <perfbook@vger.kernel.org>; Sun, 15 Nov 2026 20:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804068; x=1795408868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXm1wTFyO69aX+DG2iMDTFYiG3Wmg4Atekg/Ge8fcZ8=;
        b=j97Y0PdKXLFUBBQbOmG8uK0Y0TKEEMx4BN25MKCugR+qYeRYbeNLMSlQr5iYLcKsli
         DZnE+A7JjrmuZtk6PbH477h/+rDuarlU5p3jxXUHtqTTu3qMziAXy5nnlyBC9Ds2b3MN
         ZDrc5E6riIs1byp5XByCBQrcpFr8R/g/0bq010ja9RUMTwQqC2OqCQJKW6TTQYI5rNXY
         Y6Pq7iJnmoBtREd6hntW7ovgPrdV9HC7ItX8wB69fcm6E0uIp/NZmHxM6JDwBmNyRiFm
         R1qnjGUHj7Vv3zFmgErq0Huh6iby5dpcdlGoW6peROxftOoNpXMHKBnQ9Fxu+fyHgFb/
         NJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804068; x=1795408868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXm1wTFyO69aX+DG2iMDTFYiG3Wmg4Atekg/Ge8fcZ8=;
        b=bImyC4y0gJYECubt5JqiDiqbgSjaR1zKFsznFfcVc+5pg8rBWiHpbslf+zx+1C/oKZ
         /P7o2PGgtcmgmBMJlOjOvljVqEHC3AUt3Wn/6vy4LthMSxRhkKSZmDHqddwhv29MmXQV
         ANhljPWe5thHeI45h5VV7xnR2FpQW5C+k30Ie7nneOgbknIkqIhWKmMTD5XLp1FxfnrY
         yZm6nTXEp4iXYhLRWtcKxrAVop648w/0WeUZrUllpVtNc39rp4EZIFGtqoFrUIgXpM/p
         sFfDtKUcwhVC9BBUqKhlVCKth8tniTVPhkhJe7K42962l/K1l04g//5MoAN2G6+39MoX
         vu+w==
X-Forwarded-Encrypted: i=1; AL+hErHMMTN7ygbKae+kR8qR63nLt0vUEPTDCccqWJrVibhSyRqOv3e2hz2zfCP37R+p7+r03yLhpfWZ2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+DH87hv5rLbPj5MXLBolHLEGtJ0w4FqK3snpO48e0Io0qHzchv
	m7MWjGQUSf6NRSpAB2gzx02KYeSsp5TOysiqmX6usREVVBGVS496o6Dl
X-Gm-Gg: AYBFou3M4SYLRrrar/VBSM1+SkQAQ422OHi315Ti2lZ5wdb4AluUKVJiC6CiPA5CDxl
	ZCYKa4jlKyx17R2DbkTvKjxi5FPF9ZcgVuiFwLDrXnQnqnWB5lplczA7Xbpc2OLNwX2X6b18Qw4
	Nuhg+0ukn9DwlgyU5B4UWDKueVGdw9fSeHgQyhksmj/bZk12eqbb8uNPj5S1H5aX+cHK3jskK6E
	g3LR1EDiG0Z5bWbMiuAU3Fo+OpYIgkTwwl9HfpTQAXFzyK7Pv/wfXalOkdfuxKw7Jmk25nqxxiN
	9R8BDeXKamTvCfYF7QbLFCYJNPitfxGZ00J7fzS2p4Ys/fs0WOjL8BzLTcTPNqzZ/mcmFAt8KB5
	9MSn6aEf+VTwo1IyzNWCOoqmzIksaZHYaAS8S9McVYlSywh0ZScDQTxP9ImQNbDKNrkQUH8wsSm
	ALTHYMw2tfwmLzavkzQcLFvltBikZdrl3bUR7N+H9C7j3PRPjrltzaJbh2I6e3p7UkouP1RvEHu
	1ZHQAnZAYrXeJGFBFQpEbUJ2Nefj3T1W/42N4POgxCZHXfpTL/jqitgHll5Fjf8MhMRolQ8718i
	+qYLBsJ7G4bJr8RnGLeGaKZWrDibl8GbPx2n0EwtKMnAIkkY0JIce7no0tUesb4oqzfpYOdbbfU
	=
X-Received: by 2002:a05:6a00:4215:b0:883:71f6:5fb with SMTP id d2e1a72fcca58-8beb5bacc27mr10050352b3a.13.1794804068372;
        Sun, 15 Nov 2026 20:41:08 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8becbad7de3sm3062272b3a.0.2026.11.15.20.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 20:41:08 -0800 (PST)
Message-ID: <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
Date: Mon, 16 Nov 2026 13:41:06 +0900
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] Add reflowable HTML and EPUB3 build target
To: Ferenc Fejes <ferenc@fejes.dev>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Leonardo Bras <leobras.c@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261115210138.229034-1-ferenc@fejes.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 11/16/26 06:01, Ferenc Fejes wrote:
> Hi!
> 
> This RFC series adds experimental reflowable EPUB3 and HTML build targets
> ("make epub", "make epub-endnotes", and "make html") derived from the
> ebook-size variant via TeX Live's lwarp package and Pandoc, without
> modifying any of the book's existing .tex or .sty files.
> 
> Overview of the pipeline:
> 
> - reflow.ltx hooks into the generated perfbook-epub.tex wrapper to adapt
>   print-oriented macros, listings, tables, figures, equations, footnotes,
>   Quick Quizzes, and cross-references for HTML/EPUB output.
> - Makefile stages SVG figures in parallel under epub-figs/ and invokes
>   utilities/runlwarp.sh to run lwarp, render math SVGs via lwarpmk,
>   package the chapter-split EPUB3 with Pandoc, and run structural
>   validation checks (plus epubcheck when installed).
> - utilities/epub-fixhtml.pl and utilities/epub.css perform post-Pandoc
>   XHTML/SVG/CSS adjustments tested in KOReader and Foliate, including
>   EPUB3 popup footnotes and Quick Quiz answers (and a plain endnote
>   variant in perfbook-endnotes.epub for readers without popup support).
> 
> This is an RFC so I would be happy to hear ideas how I can improve this
> experiment. Few things:
> 
> 1. Does this non-invasive lwarp + Pandoc approach look acceptable for
>    maintaining experimental EPUB support alongside the PDF builds?
> 2. Is it worth keeping both perfbook.epub (popup footnotes/quizzes) and
>    perfbook-endnotes.epub (linked chapter endnotes), or would a single
>    target be preferable?
> 3. Are the Dockerfile package additions and non-blocking GitLab CI job
>    (allow_failure: true) aligned with how you would like this tested?
> 
> AI: This RFC generated by language models and I verified the result on
> my physical epub reader and on Linux in Foliate and KOReader epub
> readers. I used several models and refined the set for months, and with
> the latest and greatest frontier I was unable to trim ot further. The downside
> of this work is that I cannot tell with full confidence this is the
> simplest form. With more knowledge it might be improved further.
> 
> I tried three approach to get to a working epub target:
> - tex4ht: it required heavy modifications of the already existing LaTeX
>   source so I abandoned this approach. After aroung 2k LoC change it was
>   able to produce a reasonable HTML and ePUB, but it was too intrusive
>   for my taste
> - lwrap (this one): this felt the best and required the least change
>   compared to the upstream. It hooks into the build flow in the right
>   spot so no changes required in the upstream LaTeX code
> - LateXML: this is what arXiv uses to compile the paper sources to HTML
>   and they improve it in quite a fast pace. This target was intrusive
>   and a reasonable looking output required many small changes in the
>   upstream source and what worse, in the LateXML toolchain. I abandoned
>   this approach as well
> These trials executed 2-3 months ago, and lwrap was the winner, but
> models might improved since making LateXML feasible. In the past months
> I only improved the lwrap based approach, resulting this RFC.

Sounds interesting!

That said, I couldn't complete "make epub" with debian/testing's TeX Live.

In perfbook-epub_html.log, there are a couple of warnings from lwarp
as follows:

-----
(/usr/share/texlive/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
Package: fancyvrb 2026/08/13 4.7 verbatim text (tvz,hv)
\FV@CodeLineNo=\count416
\FV@InFile=\read5
\FV@TabBox=\box69
\c@FancyVerbLine=\count417
\FV@StepNumber=\count418
\FV@OutFile=\write7
)

Package lwarp Warning: A definition has changed:
(lwarp)                fancyvrb: \FV@ListProcessLine
(lwarp)                (9A9947A55E3D6D1C92E99F16EDC0BC68)
(lwarp)                 on input line 118.
-----

, and at the bottom of the log:

--------------------------------
Package verifycommand Warning: Definitions have changed.
Patches for the following macros may need to be updated.
See the previous warnings for line numbers.

Syntax:  Patching pkg -> Defining pkg: Macro (checksum)
-----
(verifycommand)  lwarp -> fancyvrb: \FV@ListProcessLine
                   (9A9947A55E3D6D1C92E99F16EDC0BC68)
-----
Look for updates to these packages.
--------------------------------

FYI, fancyvrb of upstream TeX Live is v4.8 released on
2026/10/20, which does not satisty lwarp ...

Which version of fancyvrb does lwarp expect?
("lwarpmk --version" says: lwarpmk: v0.922)

I tried debian/testing because lwarpmk in debian/latest
is v0.918.

Thanks, Akira

> 
> Thanks,
> Ferenc
> 
> Ferenc Fejes (7):
>   reflow.ltx: Add LaTeX-to-HTML shims for lwarp builds
>   utilities: Add EPUB3 post-processor and stylesheet
>   utilities/runlwarp.sh: Add lwarp and Pandoc build driver
>   Makefile, .gitignore: Add epub and html build targets
>   epub: Add endnote variant for readers without popup footnotes
>   FAQ-BUILD.txt: Document HTML and EPUB build targets
>   docker, gitlab-ci: Add EPUB build dependencies and CI job
> 
>  .gitignore                |  14 ++
>  FAQ-BUILD.txt             |  45 ++++++
>  Makefile                  |  68 ++++++++-
>  docker/Dockerfile         |   2 +-
>  reflow.ltx                | 255 ++++++++++++++++++++++++++++++++
>  utilities/epub-fixhtml.pl |  93 ++++++++++++
>  utilities/epub.css        |  63 ++++++++
>  utilities/gitlab-ci.yml   |  17 +++
>  utilities/runlwarp.sh     | 299 ++++++++++++++++++++++++++++++++++++++
>  9 files changed, 852 insertions(+), 4 deletions(-)
>  create mode 100644 reflow.ltx
>  create mode 100755 utilities/epub-fixhtml.pl
>  create mode 100644 utilities/epub.css
>  create mode 100644 utilities/runlwarp.sh
> 
> 
> base-commit: 94d572e236ab8e26fa79ff0776a3bba221647315
> --
> 2.55.0

