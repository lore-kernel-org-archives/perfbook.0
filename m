Return-Path: <SRS0=CZ29=SF=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJn1TcVWvTpgrUl9vSJU7suOSkPIv8vPaZZCAmu4io0=;
        b=Ao/Nr4RJDKYT9x6n25IOw/n+2TxL1QbfCDDBkYRa/5hF4dqYBJJ6wf1DN1AdGbFTOQ
         U5FTobmX6bu8pjfrul8aBessYHklwZDNI5gTxPOPgBr2AfoPL4tVMq+5sPhDPb25xE5D
         JqRejc94lXn0SC/w7FFvocjeFgbmz9oMMC9D3gMKRM14hhLkpJtkkQLzZiAG6TebjjvV
         wqU/n1rGvirteBclnx3IMeVWKSH7tNrXBHzBda3wb5ke//KP8qDoHwSorZucPYQblorh
         OP6VtNNV8Gznf8rZMj3QWCZj5R/5quVbbG7Z8oXF1zXTlW4xmoNfcBlfifNH9Ykbu7uB
         o4Ng==
MIME-Version: 1.0
References: <9d07bd21-9988-9b1f-d7f1-c7dae07d7a51@gmail.com>
In-Reply-To: <9d07bd21-9988-9b1f-d7f1-c7dae07d7a51@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 21 Jan 2022 22:16:11 +0800
Message-ID: <CAABZP2zAkfLCAFKcVrzv6xUetZo2piiby3xLpZnFXLANonK4hA@mail.gmail.com>
Subject: Re: [PATCH -perfbook] bib/perfmeas: Fix doi of McKenney99b
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thank Akira for your elaborate master work!

1. I edited the alphapf.bst, setting  "#0" to inlinelink
2. apply the patch to perfmeas.bib
3. invoke "make clean" (this step is necessary if I have invoked  "make" before)
4. invoke "make", and it works!

I will prepare a revised version of my patch later today.

Many thanks
Sincerely
Zhouyi
On Fri, Jan 21, 2022 at 9:32 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Escape sequences of "%3C" and "%3E" in doi cause a build error when
> "inlinelinks" option in alphapf.bst is set #0 (URLs explicit).
>
> Fix the error by using non-escaped symbols of "<" and ">" instead.
>
> Fixes: 62c6a33781d9 ("bib: url/doi updates")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Zhouyi,
>
> Prompted by your patch "RFC: make some bibliography items better",
> I tested an option in alphapf.bst (bibliography style file of
> perfbook), namely "inlinelinks".
> By setting "#0" to inlinelink (URLs explicit), URL and DOI info
> in .bib files should be printed in Bibliography.
>
> However, the build failed with McKenney99b.
>
> This patch should fix the build error.
>
> You still need to manually edit alphapf.bst, but please try
> setting "#0" to inlinelink.
>
> As you will see, if a bibliography has DOI info, URL info in
> the note field is redundant when the URL is the one reachable
> via the DOI.
>
>         Thanks, Akira
> --
>  bib/perfmeas.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bib/perfmeas.bib b/bib/perfmeas.bib
> index 9ba80cfc..51f63bb7 100644
> --- a/bib/perfmeas.bib
> +++ b/bib/perfmeas.bib
> @@ -83,7 +83,7 @@ Machine Language Rewriting",
>   year = {1999},
>   pages = {219-234},
>   bibsource = {DBLP, http://dblp.uni-trier.de},
> - doi = {10.1002/(SICI)1097-024X(199903)29:3%3C219::AID-SPE230%3E3.0.CO;2-0}
> + doi = {10.1002/(SICI)1097-024X(199903)29:3<219::AID-SPE230>3.0.CO;2-0}
>  }
>
>  @Book{Menasce94,
>
> base-commit: cd891db680ae978f5efa362cbdc074483f07042a
> --
> 2.17.1
>
