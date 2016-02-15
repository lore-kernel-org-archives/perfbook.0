Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e17.ny.us.ibm.com ([129.33.205.207]:48917 "EHLO
 e17.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751745AbcBOGNy (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 15 Feb 2016
 01:13:54 -0500
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 15 Feb
 2016 01:13:53 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id B152DC9003E
 for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 01:13:48 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1F6Do6R28508160	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 06:13:50
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1F6DnR5006142	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 01:13:50
 -0500
Date: Sun, 14 Feb 2016 22:13:55 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ: Add note on installing Steel City Comic font
Message-ID: <20160215061355.GA6719@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1455508929-12672-1-git-send-email-andrew.donnellan@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455508929-12672-1-git-send-email-andrew.donnellan@au1.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 15, 2016 at 03:02:09PM +1100, Andrew Donnellan wrote:
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Good catch, queued!

							Thanx, Paul

> ---
> 
> I needed to do this to get the comics to render properly - it took me a
> while to figure out. By the looks of it, there's no way to get Inkscape to
> pick up a font from a custom directory. If anyone's found a neater way to
> do this let me know.
> ---
>  FAQ.txt | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/FAQ.txt b/FAQ.txt
> index 80fe7f2..57ab6c9 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -1,6 +1,13 @@
>  1.	OK, I have downloaded this stuff.  What do I do now?
> 
> -	A.	Type "make" from the top-level directory.  If all goes
> +	A.	First, install the Steel City Comic font from
> +		fonts/steel-city-comic.regular.ttf. On most modern
> +		Linux systems, this can be done easily from your
> +		desktop environment, or by copying the file to the
> +		~/.fonts directory. You may need to run "fc-cache" to
> +		rebuild your font cache.
> +		
> +		Type "make" from the top-level directory.  If all goes
>  		well, this will produce a file named "perfbook.pdf",
>  		which prints two virtual pages per physical page.
> 
> -- 
> Andrew Donnellan              Software Engineer, OzLabs
> andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
> +61 2 6201 8874 (work)        IBM Australia Limited
> 

