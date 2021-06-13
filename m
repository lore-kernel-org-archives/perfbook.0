Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbhFMTNM (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 13 Jun 2021 15:13:12 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADF1C061574
        for <perfbook@vger.kernel.org>; Sun, 13 Jun 2021 12:11:11 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c11so17037498ljd.6
        for <perfbook@vger.kernel.org>; Sun, 13 Jun 2021 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=F1i8g8RAJtSIYr99sCMG3LUfyj/Uqvy/ijPj8rfsOg0=;
        b=VKjTUL5XdTbK5lWaYtFgTh0VAJqJekSFL3WBt7Y1yCQ0VQ5Te+yy9arqIN3IVNp7Sa
         O4BRTd7GPxhTBVltcr5/wO3b+q7eifhADbVDdrflPpjaksUWzTz2dCN45Uck27wuvTQ7
         urMgc9TJXI3gMbO5UX7s81/h0byV5+EsIyfvJOaszXof2jTxaWsEbTGlwvzIzhUumIr9
         ENl+5Tigvb/sI/0MDx2AuhjmC6LFq2wk9phJH/8vg+JkSHKAzmBthDj6QrpNYAv5Kirq
         8VZ+yMCIsJBWEapvjnohfz3BoOY2wOlMP5lTBj/4Tl5+jtlRGZKokya/6NAC1kdBdMRT
         xt7w==
MIME-Version: 1.0
References: <CADJjh6nHYPAwnsZHG_kdNQA1G98BAct57ijL9x78=UfYG1qhyg@mail.gmail.com>
In-Reply-To: <CADJjh6nHYPAwnsZHG_kdNQA1G98BAct57ijL9x78=UfYG1qhyg@mail.gmail.com>
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= 
        <dimhen@gmail.com>
Date: Sun, 13 Jun 2021 22:10:33 +0300
Message-ID: <CADJjh6mMZ_FfOGxYc8z2=xNjCyycWjSKXwTW=gpSot0phA7oaw@mail.gmail.com>
Subject: Re: FYI: TexLive 2021 FAIL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi!
perfbook-current 787eb45867670c1265add1437454a20a17347eca and TexLive
2021-current (2021-jun-13) build PASS

Thank you,
Dmitry

=D1=81=D1=80, 19 =D0=BC=D0=B0=D1=8F 2021 =D0=B3. =D0=B2 10:19, =D0=94=D0=BC=
=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=94=D1=8C=D1=8F=D1=87=D0=B5=D0=BD=D0=BA=
=D0=BE <dimhen@gmail.com>:
>
> Hi!
> Latest perfbook-git 28d9019e217717b1d96674a8e2a00641c38463eb
> PASS with TexLive 2021-may-11
> FAIL with TexLive-2021-may-19.
>
> See perfbook.log in attachment.
> See make & TexLive update logs at bottom.
>
> Thank you,
> Dmitry
>
> $ make
> [...]
> sh utilities/runfirstlatex.sh perfbook
> pdflatex 1 for perfbook.pdf
> [386 <./cartoons/r-2014-What-time-is-it.pdf>]
>
> LaTeX Warning: Reference `tab:app:questions:After Program Sample
> Output' on page 1 undefined on input line 52.
>
> ! LaTeX3 Error: Key 'siunitx/group-digits' accepts only a fixed set of
> (LaTeX3)        choices.
> For immediate help type H <return>.
>  ...
>
> l.64 \sisetup{group-digits=3Dfalse}
>
> ?
> ! Emergency stop.
>  ...
>
> l.64 \sisetup{group-digits=3Dfalse}
>
> ----- Fatal latex error, see perfbook.log for details. -----
> make: *** [Makefile:231: perfbook.aux] Error 1
>
>
> TexLive update log
> $ tlmgr update --self
> tlmgr: package repository http://ctan.altspu.ru/systems/texlive/tlnet (ve=
rified)
> tlmgr: saving backups to /run/media/dima/TexLive/tlpkg/backups
> [1/1, ??:??/??:??] update: texlive.infra [429k] (59127 -> 59259) ... done
> [...]
>
> [dima@dim perfbook]$ tlmgr update --all
> tlmgr: package repository http://ctan.altspu.ru/systems/texlive/tlnet (ve=
rified)
> tlmgr: saving backups to /run/media/dima/TexLive/tlpkg/backups
> [ 1/55] auto-remove: texlive-docindex ... done
> [ 2/55, ??:??/??:??] update: apa7 [761k] (58835 -> 59254) ... done
> [ 3/55, 00:08/18:40] update: babel [1656k] (58999 -> 59229) ... done
> [ 4/55, 00:18/13:13] update: beebe [858k] (58983 -> 59190) ... done
> [ 5/55, 00:24/13:00] update: bnumexpr [158k] (49643 -> 59244) ... done
> [ 6/55, 00:38/19:39] update: bxjscls [1635k] (57625 -> 59253) ... done
> [ 7/55, 01:19/27:40] update: changes [2405k] (58773 -> 59198) ... done
> [ 8/55, 01:37/23:02] update: dviinfox [6k] (44515 -> 59216) ... done
> [ 9/55, 01:45/24:55] update: easybook [345k] (59148 -> 59245) ... done
> [10/55, 01:51/25:11] update: els-cas-templates [380k] (54317 -> 59170) ..=
. done
> [11/55, 01:58/25:31] update: euclideangeometry [1056k] (54897 -> 59246) .=
.. done
> [12/55, 02:39/30:28] update: europecv [1008k] (57641 -> 59162) ... done
> [13/55, 02:51/29:33] update: huawei [365k] (58907 -> 59180) ... done
> [14/55, 03:14/32:23] update: hvfloat [8920k] (59104 -> 59255) ... done
> [15/55, 05:57/32:24] update: hvqrurl [105k] (52993 -> 59256) ... done
> [16/55, 06:02/32:41] update: kpathsea [1080k] (58622 -> 59203) ... done
> [17/55, 06:10/31:40] update: l3kernel [11376k] (59118 -> 59231) ... done
> [18/55, 07:12/23:52] update: latexmk [560k] (59081 -> 59258) ... done
> [19/55, 07:33/24:36] update: libertinust1math [2287k] (56861 -> 59241) ..=
. done
> [20/55, 08:14/25:04] update: lua-ul [116k] (58988 -> 59186) ... done
> [21/55, 08:20/25:17] update: luatexja [3398k] (58545 -> 59248) ... done
> [22/55, 09:29/26:14] update: marathi [170k] (58760 -> 59172) ... done
> [23/55, 09:42/26:43] update: musixtex [2126k] (57353 -> 59240) ... done
> [24/55, 10:25/27:12] update: newtx [6418k] (58748 -> 59238) ... done
> [25/55, 10:59/24:47] update: newtxsf [429k] (56527 -> 59227) ... done
> [26/55, 11:07/24:51] update: noindentafter [397k] (35709 -> 59195) ... do=
ne
> [27/55, 11:21/25:10] update: optex [2175k] (59055 -> 59209) ... done
> [28/55, 11:49/25:04] update: paresse [1322k] (56621 -> 59228) ... done
> [29/55, 12:50/26:31] update: pdfmanagement-testphase [6718k] (58520 ->
> 59194) ... done
> [30/55, 13:35/24:50] update: pgf [10838k] (57240 -> 59210) ... done
> [31/55, 14:58/23:04] update: pgf-spectra [1905k] (58482 -> 59242) ... don=
e
> [32/55, 15:32/23:18] update: pgfplots [15025k] (59132 -> 59243) ... done
> [33/55, 16:27/20:22] update: platex-tools [569k] (57729 -> 59211) ... don=
e
> [34/55, 16:35/20:23] update: plautopatch [140k] (57731 -> 59212) ... done
> [35/55, 16:52/20:42] update: profcollege [3910k] (58995 -> 59217) ... don=
e
> [36/55, 17:11/20:11] update: pxjahyper [146k] (59116 -> 59165) ... done
> [37/55, 17:17/20:16] update: qrbill [170k] (56190 -> 59232) ... done
> [38/55, 17:34/20:34] update: siunitx [2056k] (58909 -> 59239) ... done
> [39/55, 17:51/20:26] update: tagpdf [669k] (57955 -> 59214) ... done
> [40/55, 18:11/20:40] update: tex4ht [2196k] (59145 -> 59249) ... done
> [41/55, 18:29/20:31] update: texlive-scripts [494k] (59153 -> 59251) ... =
done
> [42/55, 18:36/20:33] update: tuda-ci [1133k] (58661 -> 59257) ... done
> [43/55, 18:53/20:37] update: unravel [907k] (52822 -> 59175) ... done
> [44/55, 19:11/20:45] update: vancouver [143k] (55423 -> 59192) ... done
> [45/55, 20:08/21:45] update: worldflags [3943k] (59021 -> 59171) ... done
> [46/55, 20:38/21:26] update: xetexko [311k] (58929 -> 59215) ... done
> [47/55, 21:07/21:52] update: xint [2509k] (59089 -> 59161) ... done
> [48/55, 21:27/21:41] auto-install: codehigh (59173) [88k] ... done
> [49/55, 21:30/21:43] auto-install: pdfextra (59204) [633k] ... done
> [50/55, 21:34/21:39] auto-install: tabularray (59183) [336k] ... done
> [51/55, 21:43/21:44] auto-install: tiscreen (59247) [122k] ... done
> [52/55, 21:46/21:46] update: collection-basic [1k] (56569 -> 59159) ... d=
one
> [53/55, 21:57/21:57] update: collection-latexextra [7k] (59009 ->
> 59183) ... done
> [54/55, 22:02/22:02] update: collection-luatex [1k] (58131 -> 59184) ... =
done
> [55/55, 22:10/22:10] update: collection-mathscience [2k] (57759 ->
> 59247) ... done
