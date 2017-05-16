Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33137 "EHLO
 mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752164AbdEPOFB (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 16
 May 2017 10:05:01 -0400
Received: by mail-oi0-f68.google.com with SMTP id h4so3516430oib.0 for
 <perfbook@vger.kernel.org>; Tue, 16 May 2017 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=11ZHHp13xsq7hN1yc2qLNe5xipA09M1QDCs8SSi5Jlk=;
 b=tddn/BihmDNOiFFk6l2uRjGaYTAgaRVyEaZ/CWE7+z3DGMCMDDMr2mdhJ/K28Bf8sI
 nsKrT/s76Laj5w5D+7atewT4Xd2PMEo7NoX+ZMdLoa8UOcofVUKIXeplj9DvbNLC7UlP
 0q9TA2glKyBl6LovZtEXpF6FlzkX6/lB7/wgjQ+AOtlYUMH5BOBOhf/ROi9E2djEel+h
 GDGY4jLn/wthUw+pTu6h+tIh8qL1OCo55PoX3n1K6S9LhOinGPCVjTq6qJF40955AUC8
 6R7U/Gm8OCqERQLc/5nZnFwC7DfcYg66KvU5Z4UOU2TQsciXsfDIaL0bECmtrt/UCx/g
 ajZA==
MIME-Version: 1.0
In-Reply-To: <1494942026-6736-1-git-send-email-junchangwang@gmail.com>
References: <1494942026-6736-1-git-send-email-junchangwang@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 16 May 2017 22:04:59 +0800
Message-ID: 
 <CABoNC830pyg6WnFs6-Pk5x0PvkrZksyrhbAE_WZtrH4oOW3F-A@mail.gmail.com>
Subject: Re: [PATCH] count_stat_eventual: Remove unnecessary READ_ONCE() and
 smp_mb()
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Junchang Wang <junchangwang@gmail.com>, Akira Yokosawa <akiyks@gmail.com>

Hi Paul and Akira,

This is the updated patch according to the discussion with Akira and
following is the summary. Please take a look. Comments are welcome!

In function eventual( ), if the value of stopflag become larger than
zero (the ''if'' branch is taken), then only the "eventual()" thread
updates stopflag. So, the READ_ONCE() within the WRITE_ONCE() is not
necessary. Remove it.
In function count_cleanup( ), there is no need to run smp_mb( ) in
between statement writing to and statement reading from the same
variable, stopflag. Remove smp_mb().


Thanks,
--Jason

On Tue, May 16, 2017 at 9:40 PM, Junchang Wang <junchangwang@gmail.com> wrote:
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> index 464de30..1365168 100644
> --- a/CodeSamples/count/count_stat_eventual.c
> +++ b/CodeSamples/count/count_stat_eventual.c
> @@ -40,16 +40,17 @@ void *eventual(void *arg)
>  {
>         int t;
>         unsigned long sum;
> +       int stopflag_l = 0;
>
> -       while (READ_ONCE(stopflag) < 3) {
> +       while (stopflag_l < 3) {
>                 sum = 0;
>                 for_each_thread(t)
>                         sum += READ_ONCE(per_thread(counter, t));
>                 WRITE_ONCE(global_count, sum);
>                 poll(NULL, 0, 1);
> -               if (READ_ONCE(stopflag)) {
> +               if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>                         smp_mb();
> -                       WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
> +                       WRITE_ONCE(stopflag, ++stopflag_l);
>                 }
>         }
>         return NULL;
> @@ -68,7 +69,6 @@ void count_init(void)
>  void count_cleanup(void)
>  {
>         WRITE_ONCE(stopflag, 1);
> -       smp_mb();
>         while (READ_ONCE(stopflag) < 3)
>                 poll(NULL, 0, 1);
>         smp_mb();
> --
> 2.7.4
>
