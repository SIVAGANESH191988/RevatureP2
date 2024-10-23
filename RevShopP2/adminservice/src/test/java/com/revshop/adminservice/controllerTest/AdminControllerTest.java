package com.revshop.adminservice.controllerTest;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.revshop.adminservice.controller.AdminController;
import com.revshop.adminservice.dto.BuyerDTO;
import com.revshop.adminservice.dto.RetailersDTO;
import com.revshop.adminservice.entity.*;
import com.revshop.adminservice.service.AdminServiceInterface;

public class AdminControllerTest {

    private MockMvc mockMvc;

    @InjectMocks
    private AdminController adminController;

    @Mock
    private AdminServiceInterface adminService;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(adminController).build();
    }

    @Test
    public void testLoginAdminSuccess() throws Exception {
        Admin mockAdmin = new Admin();
        mockAdmin.setEmail("admin@revshop.com");
        mockAdmin.setPassword("password");

        when(adminService.login(any(Admin.class))).thenReturn(1);

        mockMvc.perform(post("/admin/loginAdmin")
                .contentType(MediaType.APPLICATION_JSON)
                .content("{\"email\": \"admin@revshop.com\", \"password\": \"password\"}"))
                .andExpect(status().isOk())
                .andExpect(content().string("Welcome admin@revshop.com"));

        verify(adminService, times(1)).login(any(Admin.class));
    }

    @Test
    public void testViewBuyers() throws Exception {
        BuyerDTO buyer1 = new BuyerDTO();
        buyer1.setBuyerId(1L);
        buyer1.setName("John Doe");

        when(adminService.viewAllBuyers()).thenReturn(Arrays.asList(new Buyer(), new Buyer()));

        mockMvc.perform(get("/admin/viewBuyers"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2));

        verify(adminService, times(1)).viewAllBuyers();
    }

    @Test
    public void testViewRetailers() throws Exception {
        RetailersDTO retailerDTO1 = new RetailersDTO();
        retailerDTO1.setRetailerId(1L);
        retailerDTO1.setBusinessName("Retailer 1");

        when(adminService.viewAllNewRetailersRequests()).thenReturn(Arrays.asList(new Retailer(), new Retailer()));

        mockMvc.perform(get("/admin/viewRetailers"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2));

        verify(adminService, times(1)).viewAllNewRetailersRequests();
    }

    @Test
    public void testApproveRetailerRequest() throws Exception {
        when(adminService.approveRetailerRequest(anyLong())).thenReturn(1);

        mockMvc.perform(post("/admin/approveRetailerRequest/1"))
                .andExpect(status().isOk())
                .andExpect(content().string("Retailer approved successfully"));

        verify(adminService, times(1)).approveRetailerRequest(anyLong());
    }

    @Test
    public void testBlockRetailer() throws Exception {
        when(adminService.blockRetailer(anyLong())).thenReturn(1);

        mockMvc.perform(post("/admin/blockRetailer/1"))
                .andExpect(status().isOk())
                .andExpect(content().string("Retailer blocked successfully"));

        verify(adminService, times(1)).blockRetailer(anyLong());
    }
}
