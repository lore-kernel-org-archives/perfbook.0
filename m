Return-Path: <bp@alien8.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418415359; bh=zRBOc9s6B6V0/dMg3NbBF2LbH+gDnuKMt+cM/1dMErg=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=ABN0M0sDcI+E3zwkvvdLRvFNvrXWECDPq521sh
 +3Ed5pWQ1Yx1Fgwx4fWAxVIx2sWP57zXpijGoN53xA6/ksW60IVnLriIoCm8h43yIpu
 0octSQhX+mu+wejIuw78DAHUQKzu+EGzTlutGMielFUtLE7ffbuNW9ksWP7VK+xJkc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418415359; bh=zRBOc9s6B6V0/dMg3NbBF2LbH+gDnuKMt+cM/1dMErg=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=ABN0M0sDcI+E3zwkvvdLRvFNvrXWECDPq521sh
 +3Ed5pWQ1Yx1Fgwx4fWAxVIx2sWP57zXpijGoN53xA6/ksW60IVnLriIoCm8h43yIpu
 0octSQhX+mu+wejIuw78DAHUQKzu+EGzTlutGMielFUtLE7ffbuNW9ksWP7VK+xJkc=
Date: Fri, 12 Dec 2014 21:15:57 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141212201557.GG30699@pd.tnic>
References: <20141211201014.GN25340@linux.vnet.ibm.com>
 <20141211202238.GI31140@pd.tnic> <20141211211429.GA23711@linux.vnet.ibm.com>
 <20141212163835.GA29275@linux.vnet.ibm.com> <20141212175313.GD30699@pd.tnic>
 <20141212181804.GX25340@linux.vnet.ibm.com> <20141212184737.GE30699@pd.tnic>
 <20141212185857.GZ25340@linux.vnet.ibm.com> <20141212191337.GF30699@pd.tnic>
 <20141212193055.GC25340@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141212193055.GC25340@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Dec 12, 2014 at 11:30:55AM -0800, Paul E. McKenney wrote:
> Thank you for the info!  It is likely to be helpful to others as well.  ;-)

Yeah, I've pinged the bug, let's see what happens.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

