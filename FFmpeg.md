## FFmpeg 笔记

	avformat_open_input();
	avformat_find_stream_info();
	av_init_packet();
	av_read_frame();
	avformat_network_init();
	av_dump_format();	//打印流信息
	
Innershar
FFmpeg AVPacket相关主要函数介绍
1.AVPacket相关函数介绍

    操作AVPacket的函数大约有30个，主要分为：AVPacket的创建初始化，AVPacket中的data数据管理（clone，free,copy），AVPacket中的side_data数据管理。

void av_init_packet(AVPacket *pkt);

      初始化packet的值为默认值，该函数不会影响data引用的数据缓存空间和size，需要单独处理。

int av_new_packet(AVPacket *pkt, int size);

        av_init_packet的增强版，不但会初始化字段，还为data分配了存储空间

AVPacket *av_packet_alloc(void);

          创建一个AVPacket，将其字段设为默认值（data为空，没有数据缓存空间）。

void av_packet_free(AVPacket **pkt);

           释放使用av_packet_alloc创建的AVPacket，如果该Packet有引用计数（packet->buf不为空），则先调用av_packet_unref。

AVPacket *av_packet_clone(const AVPacket *src);

          其功能是av_packet_alloc和av_packet_ref

int av_copy_packet(AVPacket *dst, const AVPacket *src);

         复制一个新的packet，包括数据缓存

int av_copy_packet_side_data(AVPacket *dst, const AVPacket *src);

        初始化一个引用计数的packet，并指定了其数据缓存

int av_grow_packet(AVPacket *pkt, int grow_by);

            增大Packet->data指向的数据缓存

void av_shrink_packet(AVPacket *pkt, int size);

        减小Packet->data指向的数据缓存