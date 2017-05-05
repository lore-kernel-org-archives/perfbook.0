Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:36807 "EHLO
 mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752077AbdEENSn (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 5
 May 2017 09:18:43 -0400
Received: by mail-pf0-f173.google.com with SMTP id q66so2717598pfi.3 for
 <perfbook@vger.kernel.org>; Fri, 05 May 2017 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;        bh=HOX3LkP6Fl0XgGDijSvTXUiXVnY5wmKalowCL8OaQqE=;
 b=ZpeWBiJ5t1zQCqAZmbU11KxdI26q82mNOSMEopHigXHtqm+sLiHysgJe9Pgwy0oYXE
 Jlemsr43UrfLP3/cnGCb1PQeuvXE5i91AibBFssqM/zIk4KEmIKe3WO/I/ik6uWLhEVA
 ONDDTgOzIC4GXguzmxilNLENOr8enunAgvtxGn+fFAj8M3rBregLFeG2YCyO4Jrtnvh7
 peIQaoRKNvyaXj4glZfzjSpgGP2xGozvYHPHZsjOquwphevCTM1Te8b5czeWwoCmrH3Y
 wOBYTNeoM9QuueICFE43SNcU+HGQP5aRQtJWYVNQavo0sV+6mQXRlH3UufYu5EsOXAnj TxOw==
Received: from master ([116.56.129.146]) by smtp.gmail.com with ESMTPSA id
 128sm4672613pgi.49.2017.05.05.06.18.40 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128); Fri, 05 May 2017 06:18:41
 -0700 (PDT)
Date: Fri, 5 May 2017 21:18:21 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [Q] how to break a concurrent program without proper use of MB
Message-ID: <20170505131821.GA13604@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,
As mentioned in the perfbook, without proper use of memory barrier, concurrent
program will be error prone. For example, in this program:

    int a=0;
    int b=0;
    
    void* T1(void* dummy)
    {
        a = 1;
        b = 1;
        return NULL;
    }
    
    void* T2(void* dummy)
    {
        while(0 == b)
            ;
        assert(1 == a);
        return NULL;
    }
    
    int main()
    {
        pthread_t threads[2] = {PTHREAD_ONCE_INIT, PTHREAD_ONCE_INIT};

        pthread_create(&threads[0], NULL, T1, NULL);
        pthread_create(&threads[1], NULL, T2, NULL);

        pthread_join(threads[0], NULL);
        pthread_join(threads[1], NULL);

        return 0;
    }

there is chances that the assertion in T2 would fail, because there is no MB used
in the program.

However, after testing it so many times, the assertion never get throwed.

Adding a loop to increase the chance:

        for(int i=0; i< 500; i++){
            a = b = 0;
    
            pthread_create(&threads[0], NULL, T1, NULL);
            pthread_create(&threads[1], NULL, T2, NULL);
    
            pthread_join(threads[0], NULL);
            pthread_join(threads[1], NULL);
        }

the result is the same.

How can I make the assertion fail? Any trick?
(and I am using a X64 laptop)

Thanks,
Yubin
