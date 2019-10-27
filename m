Return-Path: <SRS0=QFfM=YU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SP3gztPQZCzUEYA0WD5Vub/ScS3DVlZ8X8Zmn/cZyTI=;
        b=ior3DNno3/CGYSAeWWE8vncwfdge5+GHIDWemyAWf9cnXYXUnERdwEmKznNVQMXWlc
         KxR62Bgn67F4J5kRcP1nU/TbU8uLL2SPSeubqU92mkNJJKQPK8sherl/osWgX4Om1gcv
         tMcDDcbxdrxxpYVBQdtupxZn1t/z5eVxpo6n44ssy4tDVJ0bVC7y5xUemXxHhg5xiAeL
         nTAdvNNa8L7BcNBvr0JnaAI0uJzBdi0TR3OCixKKADAMkDGCMVUpy6R24f88DkJdlRjS
         j1ljtIdBp50tPNXRDHoq+Cq4UPS979i5+bEp0By9uAVEZlKr+lwnOLFgEvB80mo5afyj
         RNaw==
Subject: Re: Question about volatile usage
References: <CA+MhoaNUYKgS02EOjNGQi1+5D_Uzw4aWf2_y_gxtBF9ZU8muKA@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6622b6a2-b23a-b72f-8ab8-bf38e39d2bc8@gmail.com>
Date: Sun, 27 Oct 2019 11:45:07 +0900
MIME-Version: 1.0
In-Reply-To: <CA+MhoaNUYKgS02EOjNGQi1+5D_Uzw4aWf2_y_gxtBF9ZU8muKA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Nan Xiao <xiaonan830818@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

(Added explicit CC: to Paul)

Hello!

On Fri, 25 Oct 2019 21:32:35 +0800, Nan Xiao wrote:
> Hi Paul and perfbook members,
> 
> Greetings from me!
> 
> I have a question about 4.3.4.2 A Volatile Solution:
> 
>> To summarize, the volatile keyword can prevent load tearing and store tearing in cases where the loads and stores are machine-sized and properly aligned. It can also prevent load fusing, store fusing, invented loads, and invented stores. However, although it does prevent the compiler from reordering volatile accesses with each other, it does nothing to prevent the CPU from reordering these accesses. Furthermore, it does nothing to prevent either compiler or CPU from reordering non-volatile accesses with each other or with volatile accesses. Preventing these types of reordering requires the techniques described in the next section.
> 
> Does this summary apply for both C and C++? Or C only？

IIUC, it applies to both C and C++.

There is an article on LWN (Linux Weekly News) based on this section at:

    https://lwn.net/Articles/793253/

The article and comments from readers there might be of your interest.

If your main concern is application code developed on modern C/C++ compilers
(C11/C++11 or later), it might be a good idea to use standard language
features which support concurrent code rather than to use volatile/volatile
casting.  (There can be changes in C/C++ standards in future, though.)

Annotation of racy accesses by READ_ONCE()/WRITE_ONCE() to prevent
compiler optimizations can be seen as abusing of volatile from the
view point of compiler developers. But it survives generations of
compilers (with occasional regression reported as bugs in compiler
optimization).

        Thanks, Akira

> 
> Thanks very much in advance!
> 
> Best Regards
> Nan Xiao
> 

