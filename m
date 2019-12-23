Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbfLWA1Y (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 22 Dec 2019 19:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577060844;
        bh=ku9KjsYTV5wxvv8Rv10vhaT90uLUtChdV0w3XJr8/kU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=C9cV3oqyBKJRsI2FUI7iF/0iYNrEnHT+xovZ8ikhRr8QP3QCAgmsJVJ+KPAHBv7Ha
         pwPUnckGq8sad1BshFTtWBbnW0kczxiHDp6ZWqCxIQSxOOOFbYYa03d8MqoIOBfiCk
         8xUJ6tjy+NWoDzMnfYyysq7woJj7THXqCgd3hjQg=
Date: Sun, 22 Dec 2019 16:27:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] utilities/autodate: Fix build error by adding '\ ' in
 \date{}
Message-ID: <20191223002723.GE13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 23, 2019 at 08:47:45AM +0900, Akira Yokosawa wrote:
> >From 7a420a8ee7df573f736c0c003ae2bc55f91bfbb0 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 23 Dec 2019 07:35:59 +0900
> Subject: [PATCH] utilities/autodate: Fix build error by adding '\ ' in \date{}
> 
> \date{} command does not accept an empty line.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Interesting.  I am having to give eight backslashes in the script in
order to get two of them in perfbook_flag.tex.  You are getting four
backslashes from the set of eight, I take it?

I have the release ready, but am having difficulties getting the results
uploaded to kernel.org.  I have an email in to the helpdesk, so hopefully
will get this set up, though holidays might results in a significant
delay.  I don't see this as an emergency, not yet, anyway.  ;-)

							Thanx, Paul

> ---
>  utilities/autodate.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 4e448976..96a25777 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -47,7 +47,7 @@ year=`date --date="$date_str" +%Y`
>  day=`date --date="$date_str" +%e`
>  if test -n "$release"
>  then
> -	release="\\\\\\\\ Release $release"
> +	release="\\\\ \\  \\\\ Release $release"
>  fi
>  
>  # env printf "\\date{%s %s, %s %s %s}\n" $month $day $year $modified $release
> -- 
> 2.24.1
> 
> 
