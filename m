Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SkfnNsjKPlOqWa/xLSCkSDuMW+I8CWiNE6uZuPG1DPA=;
 b=ud/AJ+Rn6PDF9frjb5WxZvek4xBNgGCMTwGBkO2MKTXm6HdQIkRdOizRDHWBCByFrn
 Nbl7H4IWeaRqxOTaBrQ+hCw6s3ymsIbLmeOtNb5oAmoiLF/KS7Z19cdDODSy5a18SZXe
 9jOEumWT1vo2h+kmN88litHBcJENC8Aa3OTQm4td5OMJc52Sn3lRxXVHrMurseMZwTaH
 LOor/+WXKQfL4JxXiocovGQaJishPJ6P6H0loXcn0238lWE80Wr0cLD0e1kJ4dNECTVQ
 b+w3TYaln7qhOkoK7IvfdxG0vqNHY0VAa7njir1qgPBSMqNDVOR7qSfq9O5qvdVlaCpn
 3cQQ==
Subject: Re: smp_read_barrier_depends() into READ_ONCE()
References: <20180304021305.GA4449@HP>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <da538fa2-dd74-88ab-e302-429de922145c@gmail.com>
Date: Sun, 4 Mar 2018 12:11:14 +0900
MIME-Version: 1.0
In-Reply-To: <20180304021305.GA4449@HP>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Yubin Ruan <ablacktshirt@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/03/04 10:13:05 +0800, Yubin Ruan wrote:
> Hi paul,
> 
> Please provide the commit link/hash for the changes of
> smp_read_barrier_depends() in the kernel. I remember that it was post by Akira
> once on the mailing list, but not sure I can get the right one.
> 
> Thanks,
> Yubin
> 

Hi Yubin,

It's 76ebbe78f739 ("locking/barriers: Add implicit smp_read_barrier_depends() to
READ_ONCE()").

        Thanks, Akira

