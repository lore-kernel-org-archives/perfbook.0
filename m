Return-Path: <andrea.parri@amarulasolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hvfeKN4vFBVgeJMZ535H4r7aG4gHHLY0ywVyG4ngCZQ=;
        b=Rv+9t7MDFuhOXXmPukUjO6T1KTXbmZz+K6ogpAgqSDxa/ZP8PuaYVMI/SX7/xv/98w
         p15aMikAD6dpZk9e4sG9BGymDbH9K4KQMNzn4UOYbEsO6szTRXLEw7QHBfcNtJHNuu4i
         Vdhd7ZsQkTv/TuCwA7vmsd0cVmkltrisaNRD8=
Date: Sat, 27 Oct 2018 01:06:23 +0200
From: Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: Re: perfbook
Message-ID: <20181026230623.GA11970@andrea>
References: <20181025083609.GA6766@andrea>
 <20181025100235.GR4170@linux.ibm.com>
 <20181026202014.GA4905@andrea>
 <8e6bc30b-d35f-e03e-9af4-14398bddf5b1@gmail.com>
 <20181026221402.GA5769@andrea>
 <6e0825ca-560d-4774-ce88-399c72053448@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e0825ca-560d-4774-ce88-399c72053448@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

> And you have a2ping 2.83p, right?  Otherwise, Makefile should
> complain. Hmm???

Indeed, 2.83p.


> 
> Can you remove "> /dev/null 2>&1" on line 220 of Makefile,
> and let me know what a2ping should say?

It says:

/usr/local/bin/a2ping: not a GS output from gs (0)

  Andrea


> 
> "GPL Ghostscript 9.25: Unrecoverable error, exit code 1" is not
> fatal and can be ignored as far as I know.
> 
>       Akira

