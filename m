Return-Path: <SRS0=tc9Q=ON=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FGzVLG+kT2PlHVoNpk222xGJ7OvJoL0tROztjXGSgCE=;
        b=A3nq8MTGgv5E/xQM/dqMbowcL7Mdm/xFuGCDiW6yT/o3PZAOYCwoh0xh9970bKrzyO
         i++sUb7yw9KjfESHzIiKcxOk+AZ1HHg8PaB3HedJRRYuJj7QVTCWeqd08ZWSOVBc9ThP
         AB7wW99IT6J22g71VZFHyjUiUtBJzo5evJIlA80x8dn32fom5Qm24Z/m6dFPcE+ZsMuR
         8y5lXwFpNXK1oa+KKoIyJKBWMlfRWMtiEQWHfOUS86I59Zrixbs+QIEAQNgmVxiEpVOL
         Q99qTxWuEDlERflsNfJrfvh/9Me+kfxpgloWA32yfiF0I+rxiO8Gh8cv25gqRqYU18UV
         ppDg==
Subject: Re: [PATCH -perfbook] defer: Make RCUspacetime.svg compatible with
 Inkscape 1.0 and later
References: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d28da94e-3e54-e264-5b81-01c1636dbb9f@gmail.com>
Date: Thu, 23 Sep 2021 18:44:33 +0900
MIME-Version: 1.0
In-Reply-To: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 23 Sep 2021 12:08:35 +0900, Akira Yokosawa wrote:
> Rotated labels on the "Time" axis of Figure 9.27 are misplaced when
> built on Fedora 34 (Inkscape 1.1) and Ubuntu 21.04 (Inkscape 1.0.2).

FWIW, here is a link to a screenshot with misplaced labels:

    https://fars.ee/AMQ2.png

        Thanks, Akira

> 
> Update the svg file with the one tweaked by Inkscape 1.1.
> 
> It is backward-compatible with Inkscape versions 0.92.3 (Ubuntu 18.04),
> 0.92.5 (Ubuntu 20.04), and 1.0.2 (Ubuntu 21.04).
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> Parameters for string rotation from Inkscape 0.92.5 are not handled
> as expected by Inkscape >= 1.0.
> 
> I've not seen any such breakage in .svg files made by Inkscape 0.92.3
> (Ubuntu 18.04).
> So this issue might be local to Ubuntu 20.04, but I'm not sure.
> 
> Also, it looks like fixsvgfonts.sh and fixsvgfonts-urwps.sh need some
> update to catch additional patterns of font specification strings.
> 
> I'll post a follow-up patch to update them.
> 
>         Thanks, Akira
> --
[...]
