Return-Path: <andrew.donnellan@au1.ibm.com>
Message-ID: <561DA182.8000002@au1.ibm.com>
Date: Wed, 14 Oct 2015 11:27:46 +1100
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
MIME-Version: 1.0
Subject: Re: Trouble building perfbook
References: <561C9C0E.4090703@au1.ibm.com>
 <20151013133125.GM3910@linux.vnet.ibm.com>
In-Reply-To: <20151013133125.GM3910@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 14/10/15 00:31, Paul E. McKenney wrote:
> This looks like the same LaTeX bug that Borislav Petkov ran into
> some time back.  He came up with the workaround below, does this
> work for you?

Appears to work - thanks!

> Just out of curiosity, what distro are you using?  I haven't run into
> this myself on either Ubuntu 12.04 or 14.04.

Debian 8.2 without backports. As it turns out that shipped with TeXLive 
2014.20141024. It appears the Debian bug you linked was fixed in 
2015.20150625, which my home machine running Debian testing would have 
picked up by now, but I generally prefer more stable things for my IBM 
machine...


Andrew

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited
