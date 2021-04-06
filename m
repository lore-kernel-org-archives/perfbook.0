MIME-Version: 1.0
Date: Tue, 6 Apr 2021 14:21:04 -0700
References: <975bb607-b6f7-a78f-40f4-c23bfd8fe440@gmail.com>
In-Reply-To: <975bb607-b6f7-a78f-40f4-c23bfd8fe440@gmail.com>
Message-ID: <CAJzB8QELJ9rtZJ+b_SfvNOdDNecWsz-tRZB9oVgpbHZ4y-r0ng@mail.gmail.com>
Subject: Re: [PATCH -perfbook] Makefile: Fix typo in target 'ebdf'
From: Paul McKenney <paulmckrcu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 6, 2021 at 2:50 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Fixes: 283bf48cfa39 ("Makefile: Update rules to reflect help text")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

                                          Thanx, Paul

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 797adf6a..5f17b126 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -385,7 +385,7 @@ perfbook-ix.tex perfbook-1cix.tex perfbook-ebix.tex:
>
>  perfbook-df.tex: $(PERFBOOK_BASE)
>  perfbook-1cdf.tex: perfbook-1c.tex
> -perfbook-ebef.tex: perfbook-eb.tex
> +perfbook-ebdf.tex: perfbook-eb.tex
>  perfbook-df.tex perfbook-1cdf.tex perfbook-ebdf.tex:
>         sed -e 's/setboolean{qqzbg}{true}/setboolean{qqzbg}{false}/' \
>             -e 's/setboolean{indexon}{true}/setboolean{indexon}{false}/' < $< > $@
> --
> 2.17.1
>
