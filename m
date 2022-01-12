Return-Path: <SRS0=VUZo=R4=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=odC+ClLGTuJ8DBXGh+IviFPm28/vhdwNcSsRu1WAkJQ=;
        b=fG7yMW0+AHj1YdYQ0amUWYx4QVoTUBuMt3tSqiMYlfXfNxQfVwRArIY+VEG3GejCJy
         /HBP0x+Rt5xuZFcN09XPCE9kpL2xjlsXwZJ3UdLweo9XOpNQeTh2oBtxfmU/W+xALTbU
         /hqgp9yhFJkSBzECNFqL+a7Eks5WS4QvPjyLM6AU4evKxRjlF4bd0JDXzkVRznJMAP0j
         gSEt22ITXGBx2jCTOX+wrMLXowceoOVx+i8TmcTfBe9Yr6/q0FVS6DYajAtJvGsjeONj
         0NxrF5AnA/P7+bfR9xStgOojVhpJUJdW5klKQqDTci/jd4fpVfcapG4hjyRSsm6LGohN
         WcYA==
MIME-Version: 1.0
References: <20220112052352.29385-1-zhouzhouyi@gmail.com>
In-Reply-To: <20220112052352.29385-1-zhouzhouyi@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 12 Jan 2022 13:26:10 +0800
Message-ID: <CAABZP2wg+PpJS7UZPJ8dXGyY4u=F+-_gZygh6En6UdfmzwoUpQ@mail.gmail.com>
Subject: Re: [PATCH-perfbook] Fix a typo in Bibliography
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>, Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Sorry to cc perfbook in the previous email

Sorry for the trouble
Thanks
Zhouyi

On Wed, Jan 12, 2022 at 1:24 PM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
>
> Intel Itanium Architecture Software Developer's Manual
> System Architecture should be Volume 2, Fix the typo
> in Bibliography.
>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul and Akira
>
> I think Intel Itanium Architecture Software Developer's Manual
> System Architecture should be Volume 2, and I fix the typo
> in Bibliography.
>
> Thanks
> Zhouyi
> --
>  bib/hw.bib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bib/hw.bib b/bib/hw.bib
> index 8bee3f4c..b83b9256 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -491,7 +491,7 @@ Volume 3: Instruction Set Reference",
>
>  @manual{IntelItanium02v2,
>   title="Intel Itanium Architecture Software Developer's Manual
> -Volume 3: System Architecture",
> +Volume 2: System Architecture",
>   organization="{Intel Corporation}",
>   year="2002",
>   number="245318",
> --
> 2.25.1
>
